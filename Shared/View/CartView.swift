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
                CartHeader(
                    title: "My Cart",
                    subtitle: "# items"
                )
                
                ScrollView {
                    VStack {
                        CartItem()
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding(PaddingManager.view)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background)
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

private struct CartHeader: View {
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

private struct CartItem: View {
    var body: some View {
        HStack {
            // TODO: Item Image
            Image("donutStrawberry")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            VStack {
                // TODO: Item name
                Text("Item Name")
                // TODO: Quantity button
            }
            
            Spacer()
            VStack {
                // TODO: Delete button
                // TODO: Item price
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 48)
    }
}

struct Cart_Previews: PreviewProvider {
    static var previews: some View {
        CartViewContent()
    }
}
