//
//  HomeViewModel.swift
//  DonutTemplate
//
//  Created by Seth Polyniak on 7/28/22.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    @Published private(set) var donuts: [Donut] = [
        Donut(name: "Strawberry", price: "$2.00", imageName: "donutStrawberry"),
        Donut(name: "Strawberry", price: "$2.00", imageName: "donutStrawberry"),
        Donut(name: "Strawberry", price: "$2.00", imageName: "donutStrawberry"),
        Donut(name: "Strawberry", price: "$2.00", imageName: "donutStrawberry"),
        Donut(name: "Strawberry", price: "$2.00", imageName: "donutStrawberry")
    ]
    
    /// Add specified item to Cart
    /// - Parameter itemId: the UUID String of the item to add
    func addToCart(itemId: String) {
        // TODO:
        print("Adding item to cart: \(itemId)!")
    }
}
