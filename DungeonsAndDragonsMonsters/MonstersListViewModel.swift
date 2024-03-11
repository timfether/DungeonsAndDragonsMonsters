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
            apolloClient.fetch(query: MonsterQuery(limit: 20, skip: 0))
        }
    }
}
