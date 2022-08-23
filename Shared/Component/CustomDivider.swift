//
//  CustomDivider.swift
//  DonutTemplate
//
//  Created by Seth Polyniak on 8/23/22.
//

import SwiftUI

struct CustomDivider: View {
    var color: Color = .gray
    var height: CGFloat = 2
    var body: some View {
        Rectangle()
            .fill(color)
            .frame(height: height)
            .edgesIgnoringSafeArea(.horizontal)
    }
}
