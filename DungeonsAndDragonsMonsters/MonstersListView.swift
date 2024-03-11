//
//  MonstersListView.swift
//  DungeonsAndDragonsMonsters
//
//  Created by Tim Fether on 3/11/24.
//

import SwiftUI

struct MonstersListView: View {
    @State private var viewModel = ViewModel()
    
    @State private var navigationPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            List(viewModel.monsters, id: \.index) { monster in
                Text(monster.name)
                    .onAppear {
                        viewModel.rowAppearedForMonster(withIndex: monster.index)
                    }
            }
            .navigationTitle("Monsters")
        }
    }
}

#Preview {
    MonstersListView()
}
