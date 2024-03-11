//
//  ApolloClientProviding.swift
//  DungeonsAndDragonsMonsters
//
//  Created by Tim Fether on 3/11/24.
//

import Foundation
import DnD5eAPI
import Apollo

/// A protocol to support testability of the ApolloClient; enables fake Apollo clients to be created in test scenarios.
protocol ApolloClientProviding {
    @discardableResult func fetch<Query: GraphQLQuery>(query: Query,
                                                       cachePolicy: CachePolicy,
                                                       contextIdentifier: UUID?,
                                                       context: RequestContext?,
                                                       queue: DispatchQueue,
                                                       resultHandler: GraphQLResultHandler<Query.Data>?) -> Cancellable
    
    @discardableResult func fetch<Query: GraphQLQuery>(query: Query, resultHandler: GraphQLResultHandler<Query.Data>?) -> Cancellable
}

extension ApolloClientProviding {
    @discardableResult func fetch<Query: GraphQLQuery>(query: Query, resultHandler: GraphQLResultHandler<Query.Data>?) -> Cancellable {
        return fetch(query: query,
                     cachePolicy: .default,
                     contextIdentifier: nil,
                     context: nil,
                     queue: .main,
                     resultHandler: resultHandler)
    }
}

extension ApolloClient: ApolloClientProviding {}
