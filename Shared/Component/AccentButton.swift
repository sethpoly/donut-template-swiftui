//
//  AccentButton.swift
//  DonutTemplate
//
//  Created by Seth Polyniak on 8/2/22.
//

import Foundation
import SwiftUI

struct AccentButton: View {
    let text: String
    let onClick: () -> Void
    
    var body: some View {
        // Add to cart
        Button(action: onClick) {
            Text(text)
                .foregroundColor(Color.onAccent)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.accent)
        .cornerRadius(CGFloat.medium)
    }
}

