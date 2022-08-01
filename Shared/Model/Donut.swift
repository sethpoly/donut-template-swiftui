//
//  Donut.swift
//  DonutTemplate
//
//  Created by Seth Polyniak on 7/27/22.
//

import Foundation

struct Donut: Identifiable {
    let id = UUID().uuidString
    let name: String
    let price: String
    let imageName: String
    var additionalInfoEntries: [AdditionalInfoEntry] = []
    var ingredients: [Ingredient] = []
}
