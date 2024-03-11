//
//  ApolloClient+Mock.swift
//  DungeonsAndDragonsMonstersTests
//
//  Created by Tim Fether on 3/11/24.
//

import Foundation
@testable import DungeonsAndDragonsMonsters
import Apollo
import ApolloAPI

class MockApolloClient: ApolloClientProviding {
    
    var queriesFetched = [any ApolloAPI.GraphQLQuery]()
    
    func fetch<Query>(query: Query, cachePolicy: Apollo.CachePolicy, contextIdentifier: UUID?, context: Apollo.RequestContext?, queue: DispatchQueue, resultHandler: Apollo.GraphQLResultHandler<Query.Data>?) -> Apollo.Cancellable where Query : ApolloAPI.GraphQLQuery {
        queriesFetched += [query]
        return EmptyCancellable()
    }
}
