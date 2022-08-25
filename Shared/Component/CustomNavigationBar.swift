//
//  CustomNavigationBar.swift
//  DonutTemplate
//
//  Created by Seth Polyniak on 8/24/22.
//

import SwiftUI

extension View {
    func customNavigationBar(
        leadingButtonImage: String?,
        leadingButtonAction: @escaping () -> Void,
        trailingButtonImage: String?,
        trailingButtonAction: @escaping () -> Void,
        imageTint: Color = Color.background
    ) -> some View {
        overlay {
            ZStack {
                HStack {
                    if(leadingButtonImage != nil) {
                        RoundButton(onClick: leadingButtonAction) {
                            Image(systemName: leadingButtonImage!)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 24, maxHeight: 24)
                                .foregroundColor(imageTint)
                        }
                    }
                    Spacer()
                    if(trailingButtonImage != nil) {
                        RoundButton(onClick: trailingButtonAction) {
                            Image(systemName: trailingButtonImage!)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 24, maxHeight: 24)
                                .foregroundColor(imageTint)
                        }
                    }
                }
                .padding(.horizontal, PaddingManager.view)
                .frame(maxHeight: PaddingManager.navBarHeight)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .edgesIgnoringSafeArea(.top)
        }
    }
}

