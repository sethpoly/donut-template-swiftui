//
//  CartView.swift
//  DonutTemplate (iOS)
//
//  Created by Seth Polyniak on 8/4/22.
//

import SwiftUI

struct CartView: View {
    var body: some View {
        CartViewContent()
    }
}

private struct CartViewContent: View {
    var body: some View {
        ZStack {
            VStack {
                Header(
                    title: "My Cart",
                    subtitle: "# items"
                )
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding(PaddingManager.view)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background)
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

private struct Header: View {
    let title: String
    let subtitle: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.onBackground)

            Spacer()
            Text(subtitle)
                .font(.headline)
                .foregroundColor(Color.onBackground)
        }
    }
}

struct Cart_Previews: PreviewProvider {
    static var previews: some View {
        CartViewContent()
    }
}
