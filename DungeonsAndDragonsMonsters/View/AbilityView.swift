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
            Text(abilityScore.modifierString)
                .font(.headline)
            Text(String(abilityScore.score))
                .font(.caption)
                .background(
                    Ellipse()
                        .fill(AppColor.background)
                        .stroke(.black)
                        .aspectRatio(2.0, contentMode: .fill)
                )
                .offset(x: 0, y: 2)
        }
        .padding(.horizontal, 4)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 5.0)
                .fill(AppColor.background)
                .stroke(.black)
        )
        .accessibilityElement()
        .accessibilityLabel(abilityScore.ability.longName)
        .accessibilityValue(String(localized: "\(abilityScore.modifierString), score: \(abilityScore.score)", comment: "Screen reader value, reading the ability modifier, then the ability score"))
    }
    
}
