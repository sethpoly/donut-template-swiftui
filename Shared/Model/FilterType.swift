//
//  FilterType.swift
//  DonutTemplate
//
//  Created by Seth Polyniak on 7/26/22.
//

import Foundation

enum FilterType: Int, CaseIterable {
    case all
    case favorites
    case chocolate
    case jelly 
    
    var description: String {
        switch self {
        case .all:  return "All"
        case .favorites:    return "Favorites"
        case .chocolate:    return "Chocolate"
        case .jelly:    return "Jelly"
        }
    }
}
