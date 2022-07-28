//
//  FilterType.swift
//  DonutTemplate
//
//  Created by Seth Polyniak on 7/26/22.
//

import Foundation

enum FilterType: Int, CaseIterable {
    case all = 0
    case favorites = 1
    case chocolate = 2
    case jelly = 3
    
    var description: String {
        switch self {
        case .all:  return "All"
        case .favorites:    return "Favorites"
        case .chocolate:    return "Chocolate"
        case .jelly:    return "Jelly"
        }
    }
}
