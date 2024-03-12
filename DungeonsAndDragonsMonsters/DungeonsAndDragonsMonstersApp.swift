//
//  DungeonsAndDragonsMonstersApp.swift
//  DungeonsAndDragonsMonsters
//
//  Created by Tim Fether on 3/10/24.
//

import SwiftUI

@main
struct DungeonsAndDragonsMonstersApp: App {
    var body: some Scene {
        WindowGroup {
            MonstersListView()
                .tint(.red)
                .font(.custom("Baskerville", size: 18.0))
                .onAppear {
                    prepareAppAppearance()
                }
        }
    }
    
    private func prepareAppAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: "BarBackgroundColor")
        
        let largeTitleFontSize = (appearance.largeTitleTextAttributes[NSAttributedString.Key.font] as! UIFont).pointSize
        appearance.largeTitleTextAttributes = titleTextAttributes(withSize: largeTitleFontSize)
        
        let titleFontSize = (appearance.titleTextAttributes[NSAttributedString.Key.font] as! UIFont).pointSize + 6.0
        appearance.titleTextAttributes = titleTextAttributes(withSize: titleFontSize)
        
        UINavigationBar.appearance().standardAppearance = appearance
    }
    
    private func titleTextAttributes(withSize size: CGFloat) -> [NSAttributedString.Key : Any] {
        let font = UIFont(name: "Baskerville-Bold", size: size)!
        return [
            .font: UIFontMetrics(forTextStyle: .title1).scaledFont(for: font)
        ]
    }
}
