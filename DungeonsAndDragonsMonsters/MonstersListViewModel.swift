//
//  MonstersListViewModel.swift
//  DungeonsAndDragonsMonsters
//
//  Created by Tim Fether on 3/11/24.
//

import Foundation
import DnD5eAPI
import Apollo

extension MonstersListView {
    @Observable class ViewModel {
        var apolloClient: ApolloClientProviding
        
        var monsters = [MonsterQuery.Data.Monster]()
        var fetchError: Error?
        
        init(apolloClient: ApolloClientProviding? = nil) {
            if let apolloClient {
                self.apolloClient = apolloClient
            } else {
                guard let url = URL(string: "https://www.dnd5eapi.co/graphql") else {
                    fatalError("Could not create URL to provide to apolloClient")
                }
                self.apolloClient = ApolloClient(url: url)
            }
            fetchMonsters()
        }
        
        func fetchMonsters() {
            apolloClient.fetch(query: MonsterQuery(limit: 20, skip: 0)) { [weak self] result in
                guard let self else { return }
                switch result {
                case .success(let result):
                    guard let monsters = result.data?.monsters else {
                        self.fetchError = FetchError.noMonstersData
                        return
                    }
                    self.monsters = monsters
                case .failure(let error):
                    self.fetchError = error
                }
            }
        }
        
        enum FetchError: Error {
            case noMonstersData
        }
    }
}
