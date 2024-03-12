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
    
    // MARK: - Image
    
    private var placeholderImage: some View {
        Image(systemName: "photo")
            .resizable()
            .scaledToFit()
            .frame(width: 150.0)
    }
    
    @ViewBuilder
    private var monsterImage: some View {
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
    
    // MARK: - Statistics
    
    private var abilitiesView: some View {
        return VStack(spacing: 4.0) {
            AbilityView(abilityScore: monster.strength)
            AbilityView(abilityScore: monster.dexterity)
            AbilityView(abilityScore: monster.constitution)
            AbilityView(abilityScore: monster.intelligence)
            AbilityView(abilityScore: monster.wisdom)
            AbilityView(abilityScore: monster.charisma)
        }
        .accessibilityElement(children: .contain)
    }
    
    @ViewBuilder
    private var statisticsView: some View {
        abilitiesView
            .fixedSize()
        VStack(alignment: .leading, spacing: 8.0) {
            Grid(alignment: .leading, horizontalSpacing: 16.0) {
                ForEach(statisticsConfiguration, id: \.label) { configuration in
                    GridRow {
                        Text(configuration.label).bold()
                        Text(configuration.value)
                    }
                    Divider()
                }
            }
            if let description = monster.description {
                Text(description)
                    .frame(idealWidth: 200.0)
            }
        }
        
    }

    private var statisticsConfiguration: [(label: String, value: String)] {
        return [
            ("Alignment", monster.alignment.capitalized),
            ("Size", monster.size.rawValue.capitalized),
            ("Type", monster.type.rawValue.capitalized)
        ]
    }
    
}
