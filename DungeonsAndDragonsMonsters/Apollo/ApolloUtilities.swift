//
//  Monster+Image.swift
//  DungeonsAndDragonsMonsters
//
//  Created by Tim Fether on 3/11/24.
//

import Foundation
import DnD5eAPI

extension URL {
    static var baseURLForGraphQL: URL {
        guard let url = URL(string: "https://www.dnd5eapi.co/graphql") else {
            fatalError("Could not create URL to graph QL")
        }
        return url
    }
    
    static var baseURL: URL {
        guard let url = URL(string: "https://www.dnd5eapi.co") else {
            fatalError("Could not create URL to API")
        }
        return url
    }
    
    static func urlForImage(forMonster monster: MonsterQuery.Data.Monster) -> URL? {
        guard let imagePath = monster.imagePath else {
            return nil
        }
        return URL.baseURL.appending(path: imagePath)
    }
}

