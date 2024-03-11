//
//  AbilityScore.swift
//  DungeonsAndDragonsMonsters
//
//  Created by Tim Fether on 3/11/24.
//

import Foundation

enum Ability {
    
    case strength
    case dexterity
    case constitution
    case intelligence
    case wisdom
    case charisma
    
    var shortName: String {
        switch self {
        case .strength: "STR"
        case .dexterity: "DEX"
        case .constitution: "CON"
        case .intelligence: "INT"
        case .wisdom: "WIS"
        case .charisma: "CHA"
        }
    }
    
    var longName: String {
        switch self {
        case .strength: "Strength"
        case .dexterity: "Dexterity"
        case .constitution: "Constitution"
        case .intelligence: "Intelligence"
        case .wisdom: "Wisdom"
        case .charisma: "Charisma"
        }
    }
    
}

struct AbilityScore {
    let ability: Ability
    let score: Int
    var modifier: Int {
        Int(floor(Double(score) * 0.5 - 5))
    }
    
    var modifierString: String {
        return (modifier >= 0 ? "+" : "") + "\(modifier)"
    }
}
