//
//  AbilityView.swift
//  DungeonsAndDragonsMonsters
//
//  Created by Tim Fether on 3/11/24.
//

import SwiftUI

struct AbilityView: View {
    
    let abilityScore: AbilityScore
    
    var body: some View {
        VStack {
            Text(abilityScore.ability.longName.uppercased())
                .font(.caption)
            Text("\(abilityScore.modifierString)")
                .font(.headline)
            Text("\(abilityScore.score)")
                .font(.caption)
                .background(
                    Ellipse()
                        .fill(.white)
                        .stroke(.black)
                        .aspectRatio(2.0, contentMode: .fill)
                )
                .offset(x: 0, y: 2)
        }
        .padding(.horizontal, 4)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 5.0)
                .fill(.white)
                .stroke(.black)
        )
        .accessibilityElement()
        .accessibilityLabel(abilityScore.ability.longName)
        .accessibilityValue(abilityScore.modifierString + ", score: \(abilityScore.score)")
    }
    
}
