//
//  MonstersListViewModel.swift
//  DungeonsAndDragonsMonsters
//
//  Created by Tim Fether on 3/11/24.
//

import Foundation
import DnD5eAPI
import Apollo

fileprivate extension Int {
    static var numberOfMonstersToFetchEachTime = 20
    static var numberOfMonstersToHaveRemainingBeforeFetchingMore = 5
}

extension MonstersListView {
    @Observable class ViewModel {
        var apolloClient: ApolloClientProviding
        
        var monsters = [MonsterQuery.Data.Monster]()
        var fetchError: Error?
        
        var numberOfMonstersRequested: Int = 0
        
        init(apolloClient: ApolloClientProviding? = nil) {
            self.apolloClient = apolloClient ?? ApolloClient(url: .baseURLForGraphQL)
            fetchMonsters()
        }
        
        func fetchMonsters() {
            apolloClient.fetch(query: MonsterQuery(limit: .numberOfMonstersToFetchEachTime,
                                                   skip: GraphQLNullable(integerLiteral: numberOfMonstersRequested))) { [weak self] result in
                guard let self else { return }
                switch result {
                case .success(let result):
                    guard let monsters = result.data?.monsters else {
                        self.fetchError = FetchError.noMonstersData
                        return
                    }
                    self.monsters += monsters
                case .failure(let error):
                    self.fetchError = error
                    self.numberOfMonstersRequested = monsters.count
                }
            }
            numberOfMonstersRequested += .numberOfMonstersToFetchEachTime
        }
        
        func rowAppearedForMonster(withIndex uniqueIdentifyingindex: String) {
            guard let integerIndexOfMonsterThatAppeared = monsters.firstIndex(where: { $0.index == uniqueIdentifyingindex }) else {
                assertionFailure("monster with provided index should exist")
                return
            }
            if integerIndexOfMonsterThatAppeared >= numberOfMonstersRequested - .numberOfMonstersToHaveRemainingBeforeFetchingMore - 1 {
                fetchMonsters()
            }
        }
        
        enum FetchError: Error {
            case noMonstersData
        }
    }
}
