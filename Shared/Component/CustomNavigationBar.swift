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
    var isBorderButton: Bool = false
    @ViewBuilder var content: Content
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                HStack {
                    if(leadingButtonImage != nil) {
                        if(isBorderButton) {
                            RoundButton(onClick: leadingButtonAction) {
                                IconImage(imageName: leadingButtonImage!, imageTint: imageTint)
                            }
                        } else {
                            Button(action: leadingButtonAction) {
                                IconImage(imageName: leadingButtonImage!, imageTint: imageTint)
                            }
                        }
                    }
                    Spacer()
                    if(trailingButtonImage != nil) {
                        if(isBorderButton) {
                            RoundButton(onClick: trailingButtonAction) {
                                IconImage(imageName: trailingButtonImage!, imageTint: imageTint)
                            }
                        } else {
                            Button(action: trailingButtonAction) {
                                IconImage(imageName: trailingButtonImage!, imageTint: imageTint)
                            }
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

private struct IconImage: View {
    let imageName: String
    let imageTint: Color
    
    var body: some View {
        Image(systemName: imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: 24, maxHeight: 24)
            .foregroundColor(imageTint)
    }
}

