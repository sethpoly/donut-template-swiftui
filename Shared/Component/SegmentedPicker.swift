//
//  SegmentedPicker.swift
//  DonutTemplate
//
//  Created by Seth Polyniak on 7/26/22.
//

import SwiftUI

struct SegmentedPicker: View {
    @Binding var selection: Int
    let titles: [String]
    let selectedBackgroundColor: Color = Color.accent
    let selectedTextColor: Color = Color.onAccent
    let textColor: Color = Color.onBackground
    
    var body: some View {
        ZStack {
            Color.clear
            ScrollView(.horizontal) {
                HStack(spacing: 12) {
                    ForEach(self.titles.indices, id: \.self) { index in
                        Button(action: { self.selection = index }) {
                            Text(self.titles[index])
                                .foregroundColor(selection == index ? selectedTextColor: textColor)
                                .lineLimit(1)
                                .animation(.default, value: selection)
                        }
                        .padding(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
                        .background(
                            Capsule()
                                .fill(self.selection == index ? selectedBackgroundColor : Color.clear)
                                .animation(.default, value: selection)
                        )
                    }
                }
            }
        }
    }
}
