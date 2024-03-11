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
    
}
