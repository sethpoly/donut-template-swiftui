//
//  CustomNavigationBar.swift
//  DonutTemplate
//
//  Created by Seth Polyniak on 8/24/22.
//

import SwiftUI

struct CustomNavigationBar<Content: View>: View {
    let leadingButtonImage: String?
    let leadingButtonAction: () -> Void
    let trailingButtonImage: String?
    let trailingButtonAction: () -> Void
    var imageTint: Color = Color.background
    let backgroundColor: Color
    @ViewBuilder var content: Content
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                HStack {
                    if(leadingButtonImage != nil) {
                        Button(action: leadingButtonAction) {
                            Image(systemName: leadingButtonImage!)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 24, maxHeight: 24)
                                .foregroundColor(imageTint)
                        }
                    }
                    Spacer()
                    if(trailingButtonImage != nil) {
                        Button(action: trailingButtonAction) {
                            Image(systemName: trailingButtonImage!)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 24, maxHeight: 24)
                                .foregroundColor(imageTint)
                        }
                    }
                }
                .padding(.horizontal, PaddingManager.view)
                content
            }
        }
        .frame(maxWidth: .infinity)
        .background(backgroundColor)
    }
}

