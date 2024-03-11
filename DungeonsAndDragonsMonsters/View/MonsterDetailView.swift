//
//  MonsterDetailView.swift
//  DungeonsAndDragonsMonsters
//
//  Created by Tim Fether on 3/11/24.
//

import SwiftUI
import DnD5eAPI

fileprivate extension CGFloat {
    static var imageHeight: CGFloat { 300.0 }
}

struct MonsterDetailView: View {
    @State var monster: MonsterQuery.Data.Monster
    var body: some View {
        ScrollView {
            VStack {
                monsterImage
                HStack(alignment: .top, spacing: 20.0) {
                    abilitiesView
                        .fixedSize()
                    VStack(alignment: .leading, spacing: 8.0) {
                        if let description = monster.description {
                            Text(description)
                        }
                    }
                    Spacer()
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle(monster.name)
    }
    
    var placeholderImage: some View {
        Image(systemName: "photo")
            .resizable()
            .scaledToFit()
            .frame(width: 150.0)
    }
    
    @ViewBuilder
    var monsterImage: some View {
        if let imageURL = URL.urlForImage(forMonster: monster) {
            AsyncImage(url: imageURL) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                placeholderImage
                    .symbolEffect(.variableColor.iterative, options: .repeating.speed(0.5))
            }
            .frame(height: .imageHeight)
        } else {
            ZStack {
                Color(UIColor(white: 0.9, alpha: 1.0))
                VStack {
                    placeholderImage
                    Text("No Image")
                }
                .foregroundStyle(Color(UIColor(white: 0.5, alpha: 1.0)))
            }
            .frame(height: .imageHeight)
            
        }
    }
    
    var abilitiesView: some View {
        return VStack(spacing: 4.0) {
            AbilityView(abilityScore: monster.strength)
            AbilityView(abilityScore: monster.dexterity)
            AbilityView(abilityScore: monster.constitution)
            AbilityView(abilityScore: monster.intelligence)
            AbilityView(abilityScore: monster.wisdom)
            AbilityView(abilityScore: monster.charisma)
        }
    }
    
}
