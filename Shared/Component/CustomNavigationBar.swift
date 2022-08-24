//
//  CustomNavigationBar.swift
//  DonutTemplate
//
//  Created by Seth Polyniak on 8/24/22.
//

import SwiftUI

extension View {
    func customNavigationBar(
        leadingButtonImage: String,
        leadingButtonAction: @escaping () -> Void,
        trailingButtonImage: String,
        trailingButtonAction: @escaping () -> Void
    ) -> some View {
        overlay {
            ZStack {
                HStack {
                    Button(action: leadingButtonAction) {
                        Image(systemName: leadingButtonImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 32, maxHeight: 32)
                            .foregroundColor(Color.background)
                    }
                    Spacer()
                    Button(action: trailingButtonAction) {
                        Image(systemName: trailingButtonImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 32, maxHeight: 32)
                            .foregroundColor(Color.background)
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

