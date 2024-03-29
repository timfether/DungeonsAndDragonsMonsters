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
            List(viewModel.monsters, id: \.id) { monster in
                NavigationLink(value: monster) {
                    Text(monster.name)
                        .onAppear {
                            viewModel.rowAppearedForMonster(withID: monster.id)
                        }
                }
                .listRowBackground(AppColor.background)
            }
            .listStyle(.plain)
            .background { AppColor.background.ignoresSafeArea() }
            .navigationTitle(String(localized: "Monsters (screen title)", defaultValue: "Monsters", comment: "Title of the screen showing the list of monsters"))
            .navigationDestination(for: MonsterQuery.Data.Monster.self) {
                MonsterDetailView(monster: $0)
            }
        }
    }
}

#Preview {
    MonstersListView()
}
