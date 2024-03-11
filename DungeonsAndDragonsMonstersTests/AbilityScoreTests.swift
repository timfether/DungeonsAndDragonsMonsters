//
//  AbilityScoreTests.swift
//  DungeonsAndDragonsMonstersTests
//
//  Created by Tim Fether on 3/11/24.
//

import XCTest
@testable import DungeonsAndDragonsMonsters

final class AbilityScoreTests: XCTestCase {
    
    let expectedScoreToModifierMappings = [
        0: -5,
        1: -5,
        2: -4,
        3: -4,
        4: -3,
        5: -3,
        6: -2,
        7: -2,
        8: -1,
        9: -1,
        10: 0,
        11: 0,
        12: 1,
        13: 1,
        14: 2,
        15: 2,
        16: 3,
        17: 3,
        18: 4,
        19: 4,
        20: 5,
        21: 5,
        22: 6,
        23: 6
    ]
    
    func testAbilityModifiers() {
        for score in (0..<expectedScoreToModifierMappings.count) {
            let abilityScore = AbilityScore(ability: .strength, score: score)
            guard let expectedModifier = expectedScoreToModifierMappings[score] else {
                XCTFail("could not find expected modifier mapping")
                return
            }
            XCTAssertEqual(abilityScore.modifier, expectedModifier, "expected ability score of \(score) to have modifier of \(expectedModifier); got \(abilityScore.modifier)")
        }
    }
    
    func testAbilityModifierStringDisplaysAPlusWhenModifierIsZero() {
        let abilityScore = AbilityScore(ability: .strength, score: 10)
        XCTAssertEqual(abilityScore.modifierString, "+0")
    }
    
    func testAbilityModifierStringDisplaysAPlusWhenModifierIsPositive() {
        let abilityScore = AbilityScore(ability: .strength, score: 12)
        XCTAssertEqual(abilityScore.modifierString, "+1")
    }

    func testAbilityModifierStringDoesNotDisplayAPlusWhenModifierIsNegative() {
        let abilityScore = AbilityScore(ability: .strength, score: 9)
        XCTAssertEqual(abilityScore.modifierString, "-1")
    }

}
