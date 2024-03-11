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
                ViewThatFits(in: .horizontal) {
                    HStack(alignment: .top, spacing: 20.0) {
                        statisticsView
                        Spacer()
                    }
                    VStack(alignment: .leading) {
                        statisticsView
                    }
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle(monster.name)
        .containerRelativeFrame(.horizontal)
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
    
    @ViewBuilder
    var statisticsView: some View {
        abilitiesView
            .fixedSize()
        VStack(alignment: .leading, spacing: 8.0) {
            Grid(alignment: .leading, horizontalSpacing: 16.0) {
                GridRow {
                    Text("Alignment")
                        .bold()
                    Text(monster.alignment.capitalized)
                }
                Divider()
                GridRow {
                    Text("Size")
                        .bold()
                    Text(monster.size.rawValue.capitalized)
                }
                Divider()
                GridRow {
                    Text("Type")
                        .bold()
                    Text(monster.type.rawValue.capitalized)
                }
                Divider()
            }
            if let description = monster.description {
                Text(description)
                    .frame(idealWidth: 200.0)
            }
        }
    }
    
}
