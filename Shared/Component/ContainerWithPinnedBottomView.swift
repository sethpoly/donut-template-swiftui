//
//  ContainerPinned.swift
//  DonutTemplate
//
//  Created by Seth Polyniak on 9/1/22.
//

import SwiftUI

struct ContainerWithPinnedBottomView<Content, Pinned>: View
                                     where Content: View, Pinned: View {

    private var content: () -> Content
    private var bottomView: () -> Pinned

    @inlinable public init(@ViewBuilder pinnedView: @escaping () -> Pinned,
                            @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.bottomView = pinnedView
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            Rectangle().fill(Color.clear) // !! Extends ZStack to full screen
            GeometryReader { _ in
                ZStack {
                    self.content()
                }
            }
            self.bottomView()
                .alignmentGuide(.bottom) { $0[.bottom] }
        }
    }
    
}
