//
//  Router.swift
//  DonutTemplate (iOS)
//
//  Created by Seth Polyniak on 8/25/22.
//

import Foundation
import NavigationStack

/// ``Router`` manages the navigation of the given ``NavigationStack`` to all other routes
/// and their given parameters
class Router {
    private let navStack: NavigationStackCompat
    
    init(navStack: NavigationStackCompat) {
        self.navStack = navStack
    }
    
    func toDonutDetail() {
        self.navStack.push(DonutDetailView(router: self))
    }
    
    func toHome() {
        self.navStack.push(HomeView(router: self))
    }
}
