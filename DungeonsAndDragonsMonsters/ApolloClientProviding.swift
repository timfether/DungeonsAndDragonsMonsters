//
//  ApolloClientProviding.swift
//  DungeonsAndDragonsMonsters
//
//  Created by Tim Fether on 3/11/24.
//

import Foundation
import DnD5eAPI
import Apollo

protocol ApolloClientProviding {
    @discardableResult func fetch<Query: GraphQLQuery>(query: Query,
                                                       cachePolicy: CachePolicy,
                                                       contextIdentifier: UUID?,
                                                       context: RequestContext?,
                                                       queue: DispatchQueue,
                                                       resultHandler: GraphQLResultHandler<Query.Data>?) -> Cancellable
    
    @discardableResult func fetch<Query: GraphQLQuery>(query: Query) -> Cancellable
}

extension ApolloClientProviding {
    @discardableResult func fetch<Query: GraphQLQuery>(query: Query) -> Cancellable {
        return fetch(query: query,
                     cachePolicy: .default,
                     contextIdentifier: nil,
                     context: nil,
                     queue: .main,
                     resultHandler: nil)
    }
}

extension ApolloClient: ApolloClientProviding {}
