//
//  View+Extension.swift
//  DonutTemplate
//
//  Created by Seth Polyniak on 7/26/22.
//

import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

