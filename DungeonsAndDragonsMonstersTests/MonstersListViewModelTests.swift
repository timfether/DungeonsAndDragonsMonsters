//
//  MonstersListViewModelTests.swift
//  DungeonsAndDragonsMonstersTests
//
//  Created by Tim Fether on 3/11/24.
//

import XCTest
@testable import DungeonsAndDragonsMonsters
import DnD5eAPI
import Apollo
import ApolloTestSupport
import DungeonsAndDragonsMonstersTestMocks

final class MonstersListViewModelTests: XCTestCase {
    
    struct FakeError: Error, Equatable {}

    func testViewModelFetchesMonstersWithCorrectQueryOnInit() throws {
        let mockApolloClient = MockApolloClient()
        let _ = MonstersListView.ViewModel(apolloClient: mockApolloClient)
        XCTAssertEqual(mockApolloClient.queriesFetched.count, 1)
        guard let query = mockApolloClient.queriesFetched[0] as? MonsterQuery else {
            XCTFail("Expected a MonsterQuery")
            return
        }
        XCTAssertEqual(query.limit, 20)
        XCTAssertEqual(query.skip, 0)
    }
    
    func testViewModelCapturesErrorWhenThereIsNoDataInTheResult() {
        let mockApolloClient = MockApolloClient()
        let viewModel = MonstersListView.ViewModel(apolloClient: mockApolloClient)
        guard let handler = mockApolloClient.resultHandlers[0] as? Apollo.GraphQLResultHandler<MonsterQuery.Data> else {
            XCTFail("Unexpected result handler type")
            return
        }
        handler(.success(GraphQLResult(data: nil, extensions: nil, errors: nil, source: .cache, dependentKeys: nil)))
        
        XCTAssertEqual(viewModel.monsters, [])
        XCTAssertEqual(viewModel.fetchError as? MonstersListView.ViewModel.FetchError, MonstersListView.ViewModel.FetchError.noMonstersData)
    }

    func testViewModelCapturesErrorWhenFetchFails() {
        let mockApolloClient = MockApolloClient()
        let viewModel = MonstersListView.ViewModel(apolloClient: mockApolloClient)
        guard let handler = mockApolloClient.resultHandlers[0] as? Apollo.GraphQLResultHandler<MonsterQuery.Data> else {
            XCTFail("Unexpected result handler type")
            return
        }
        handler(.failure(FakeError()))
        
        XCTAssertEqual(viewModel.monsters, [])
        XCTAssertEqual(viewModel.fetchError as? FakeError, FakeError())
    }
    
    func testFetchingOccursWhenRowsAppear() {
        let mockApolloClient = MockApolloClient()
        let viewModel = MonstersListView.ViewModel(apolloClient: mockApolloClient)
        
        XCTContext.runActivity(named: "Creation") { _ in
            XCTAssertEqual(mockApolloClient.queriesFetched.count, 1)
            guard let query = mockApolloClient.queriesFetched[0] as? MonsterQuery else {
                XCTFail("Expected a MonsterQuery")
                return
            }
            XCTAssertEqual(query.limit, 20)
            XCTAssertEqual(query.skip, 0)
            
            viewModel.monsters = (1...20).map {
                let monsterMock = Mock<Monster>()
                monsterMock.index = "\($0)"
                return MonsterQuery.Data.Monster.from(monsterMock)
            }
        }
        
        XCTContext.runActivity(named: "Simulate scroll through first few items, which should not trigger an additional fetch") { _ in
            for i in (1...15) {
                viewModel.rowAppearedForMonster(withIndex: "\(i)")
                XCTAssertEqual(mockApolloClient.queriesFetched.count, 1)
            }
        }
        
        XCTContext.runActivity(named: "Simulate scrolling to the item that should trigger the first additional fetch") { _ in
            
            viewModel.rowAppearedForMonster(withIndex: "\(16)")
            XCTAssertEqual(mockApolloClient.queriesFetched.count, 2)
            
            guard let query = mockApolloClient.queriesFetched[1] as? MonsterQuery else {
                XCTFail("Expected a MonsterQuery")
                return
            }
            XCTAssertEqual(query.limit, 20)
            XCTAssertEqual(query.skip, 20)
            
            viewModel.monsters += (21...40).map {
                let monsterMock = Mock<Monster>()
                monsterMock.index = "\($0)"
                return MonsterQuery.Data.Monster.from(monsterMock)
            }
        }
        
        XCTContext.runActivity(named: "Simulate scrolling through items which should not trigger an additional fetch") { _ in
            for i in (17...35) {
                viewModel.rowAppearedForMonster(withIndex: "\(i)")
                XCTAssertEqual(mockApolloClient.queriesFetched.count, 2)
            }
        }
        
        XCTContext.runActivity(named: "Simulate scrolling to the item that should trigger the second additional fetch") { _ in
            viewModel.rowAppearedForMonster(withIndex: "\(36)")
            XCTAssertEqual(mockApolloClient.queriesFetched.count, 3)
            
            guard let query = mockApolloClient.queriesFetched[2] as? MonsterQuery else {
                XCTFail("Expected a MonsterQuery")
                return
            }
            XCTAssertEqual(query.limit, 20)
            XCTAssertEqual(query.skip, 40)
        }
    }
    
}
