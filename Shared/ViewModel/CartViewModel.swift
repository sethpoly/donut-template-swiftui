//
//  CartViewModel.swift
//  DonutTemplate
//
//  Created by Seth Polyniak on 8/22/22.
//


import Foundation
import SwiftUI

class CartViewModel: ObservableObject {
    @Published private(set) var donuts: [Donut] = [
        Donut(name: "Strawberry", price: "$2.00", imageName: "donutStrawberry"),
        Donut(name: "Strawberry", price: "$2.00", imageName: "donutStrawberry"),
        Donut(name: "Strawberry", price: "$2.00", imageName: "donutStrawberry"),
        Donut(name: "Strawberry", price: "$2.00", imageName: "donutStrawberry"),
        Donut(name: "Strawberry", price: "$2.00", imageName: "donutStrawberry")
    ]
}
