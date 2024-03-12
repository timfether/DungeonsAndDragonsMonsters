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
        let titleFontSize = (appearance.titleTextAttributes[NSAttributedString.Key.font] as! UIFont).pointSize + 6.0
        
        appearance.largeTitleTextAttributes = textAttributes(withSize: largeTitleFontSize, forTextStyle: .title1)
        appearance.titleTextAttributes = textAttributes(withSize: titleFontSize, forTextStyle: .title1)
        appearance.backButtonAppearance.normal.titleTextAttributes = textAttributes(withSize: UIFont.systemFontSize + 4.0, forTextStyle: .body)
        
        UINavigationBar.appearance().standardAppearance = appearance
    }
    
    private func textAttributes(withSize size: CGFloat, forTextStyle textStyle: UIFont.TextStyle) -> [NSAttributedString.Key : Any] {
        let font = UIFont(name: "Baskerville-Bold", size: size)!
        return [
            .font: UIFontMetrics(forTextStyle: textStyle).scaledFont(for: font)
        ]
    }
}
