//
//  MainView.swift
//  DonutTemplate (iOS)
//
//  Created by Seth Polyniak on 8/25/22.
//

import SwiftUI
import NavigationStack

/// Initial view of application after @Main is configured
struct MainView: View {
    let navigationStack = NavigationStackCompat()
    
    var body: some View {
        NavigationStackView(navigationStack: navigationStack) {
            HomeView(router: Router(navStack: navigationStack))
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
