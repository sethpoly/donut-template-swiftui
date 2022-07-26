//
//  SegmentedPicker.swift
//  DonutTemplate
//
//  Created by Seth Polyniak on 7/26/22.
//

import SwiftUI

struct CustomSegmentedPickerView: View {
    @Binding var selection: Int
    let titles: [String]
    let selectedBackgroundColor: Color = Color.accent
    let selectedTextColor: Color = Color.onAccent
    let textColor: Color = Color.onBackground
    @State private var frames = Array<CGRect>(repeating: .zero, count: 4)
    
    var body: some View {
        VStack {
            ZStack {
                HStack(spacing: 10) {
                    ForEach(self.titles.indices, id: \.self) { index in
                        Button(action: { self.selection = index }) {
                            Text(self.titles[index])
                                .foregroundColor(self.selection == index ? selectedTextColor: textColor)
                        }.padding(EdgeInsets(top: 16, leading: 20, bottom: 16, trailing: 20)).background(
                            GeometryReader { geo in
                                Color.clear.onAppear { self.setFrame(index: index, frame: geo.frame(in: .global)) }
                            }
                        )
                    }
                }
                .background(
                    Capsule().fill(
                        selectedBackgroundColor)
                        .frame(width: self.frames[self.selection].width,
                               height: self.frames[self.selection].height, alignment: .topLeading)
                        .offset(x: self.frames[self.selection].minX - self.frames[0].minX)
                    , alignment: .leading
                )
            }
            .animation(.default, value: selection)
        }
    }
    
    func setFrame(index: Int, frame: CGRect) {
        self.frames[index] = frame
    }
}
