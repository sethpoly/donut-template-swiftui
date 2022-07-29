//
//  AdditionalInfoType.swift
//  DonutTemplate
//
//  Created by Seth Polyniak on 7/29/22.
//

import Foundation

struct AdditionalInfoEntry {
    let id = UUID()
    let type: AdditionalInfoType
    let value: LosslessStringConvertible
}

enum AdditionalInfoType: Int, CaseIterable {
    case stars
    case calories
    
    var description: String {
        switch self {
        case .stars:        return ""
        case .calories:     return "Cal."
        }
    }
    
    var imageName: String {
        switch self {
        case .stars:        return "star.fill"
        case .calories:     return "flame.fill"
        }
    }
    
}
