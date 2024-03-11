//
//  MonstersListView.swift
//  DungeonsAndDragonsMonsters
//
//  Created by Tim Fether on 3/11/24.
//

import SwiftUI
import DnD5eAPI

struct MonstersListView: View {
    @State private var viewModel = ViewModel()
    
    @State private var navigationPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            List(viewModel.monsters, id: \.index) { monster in
                NavigationLink(value: monster) {
                    Text(monster.name)
                        .onAppear {
                            viewModel.rowAppearedForMonster(withIndex: monster.index)
                        }
                }
            }
            .navigationTitle("Monsters")
            .navigationDestination(for: MonsterQuery.Data.Monster.self) {
                Text($0.name)
            }
        }
    }
}

#Preview {
    MonstersListView()
}
