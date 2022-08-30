//
//  RoundButton.swift
//  DonutTemplate
//
//  Created by Seth Polyniak on 8/25/22.
//

import SwiftUI

struct RoundButton<Content: View>: View {
    let onClick: () -> Void
    var backgroundColor: Color = Color.white
    @ViewBuilder var content: Content
    
    var body: some View {
        Button(action: onClick) {
            content
        }
        .padding(6)
        .background(backgroundColor)
        .cornerRadius(6)
    }
}
