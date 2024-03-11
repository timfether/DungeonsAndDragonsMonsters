//
//  MonstersListView.swift
//  DungeonsAndDragonsMonsters
//
//  Created by Tim Fether on 3/11/24.
//

import SwiftUI

struct MonstersListView: View {
    @State private var viewModel = ViewModel()
    
    var body: some View {
        List(viewModel.monsters, id: \.index) { monster in
            Text(monster.name)
                .onAppear {
                    viewModel.rowAppearedForMonster(withIndex: monster.index)
                }
        }
    }
}

#Preview {
    MonstersListView()
}
