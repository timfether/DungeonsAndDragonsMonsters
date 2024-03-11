//
//  Monster+Abilities.swift
//  DungeonsAndDragonsMonsters
//
//  Created by Tim Fether on 3/11/24.
//

import Foundation
import DnD5eAPI

extension MonsterQuery.Data.Monster {
    var strength: AbilityScore {
        return AbilityScore(ability: .strength, score: strengthScore)
    }
    
    var dexterity: AbilityScore {
        return AbilityScore(ability: .dexterity, score: dexterityScore)
    }
    
    var constitution: AbilityScore {
        return AbilityScore(ability: .constitution, score: constitutionScore)
    }
    
    var intelligence: AbilityScore {
        return AbilityScore(ability: .intelligence, score: intelligenceScore)
    }
    
    var wisdom: AbilityScore {
        return AbilityScore(ability: .wisdom, score: wisdomScore)
    }
    
    var charisma: AbilityScore {
        return AbilityScore(ability: .charisma, score: charismaScore)
    }
}
