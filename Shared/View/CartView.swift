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
                        CartItem(
                            onDeleteClick: {
                                /**TODO: */
                            }
                        )
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
    @State var testQuantity: Int = 1
    let onDeleteClick: () -> Void
    
    var body: some View {
        HStack {
            // Item Image
            Image("donutStrawberry")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxHeight: 64)
            
            Spacer()
                .frame(width: 12)
            
            VStack(spacing: 6) {
                HStack {
                    // Item name
                    Text("Item Name")
                        .foregroundColor(Color.onBackground)
                    Spacer()
                    // Delete button
                    Button(action: onDeleteClick) {
                        Image(systemName: "trash")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 16, maxHeight: 16)
                            .foregroundColor(Color.onForeground)
                    }
                }
                
                HStack {
                    // TODO: Quantity button
                    QuantityButtonAlternate(
                        quantity: $testQuantity
                    )
                    Spacer()
                    // Item price
                    Text("$9.99")
                        .foregroundColor(Color.onForeground)
                }
            }
            .frame(maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity)
    }
}

struct QuantityButtonAlternate: View {
    @Binding var quantity: Int
    
    var body: some View {
        HStack() {
            BorderedImageButton(
                imageName: "minus",
                onClick: {
                    quantity -= 1
                }
            )
            Text("\(quantity)")
                .foregroundColor(Color.onBackground)
                .fixedSize()
                .frame(width: 24)
            BorderedImageButton(
                imageName: "plus", onClick: {
                    quantity += 1
                }
            )
        }
        .fixedSize()
    }
}

private struct BorderedImageButton: View {
    let imageName: String
    let color: Color = Color.onBackground.opacity(0.7)
    let onClick: () -> Void
    
    var body: some View {
        Button(action: onClick) {
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 12, maxHeight: 12)
                .foregroundColor(color)
                .padding(4)
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(color, lineWidth: 2)
                )
        }
    }
}

struct Cart_Previews: PreviewProvider {
    static var previews: some View {
        CartViewContent()
    }
}
