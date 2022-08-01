//
//  Ingredient.swift
//  DonutTemplate
//
//  Created by Seth Polyniak on 8/1/22.
//

import Foundation

enum Ingredient: CaseIterable {
    case flour
    case sugar
    case icing
    case sprinkles
    
    var description: String {
        switch self {
        case .flour: return "Flour"
        case .sugar: return "Sugar"
        case .icing: return "Icing"
        case .sprinkles: return "Sprinkles"
        }
    }
}
