//
//  MonsterDetailView.swift
//  DungeonsAndDragonsMonsters
//
//  Created by Tim Fether on 3/11/24.
//

import SwiftUI
import DnD5eAPI

struct MonsterDetailView: View {
    @State var monster: MonsterQuery.Data.Monster
    
    var body: some View {
        VStack {}
            .navigationTitle(monster.name)
    }
}
