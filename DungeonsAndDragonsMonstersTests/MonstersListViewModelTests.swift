//
//  MonstersListViewModelTests.swift
//  DungeonsAndDragonsMonstersTests
//
//  Created by Tim Fether on 3/11/24.
//

import XCTest
@testable import DungeonsAndDragonsMonsters
import DnD5eAPI

final class MonstersListViewModelTests: XCTestCase {

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

}
