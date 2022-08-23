//
//  CartView.swift
//  DonutTemplate (iOS)
//
//  Created by Seth Polyniak on 8/4/22.
//

import SwiftUI

struct CartView: View {
    @ObservedObject var cartViewModel = CartViewModel()
    var body: some View {
        CartViewContent(
            items: cartViewModel.donuts
        )
    }
}

private struct CartViewContent: View {
    let items: [Donut]
    var body: some View {
        GeometryReader { metrics in
            ZStack {
                VStack {
                    CartHeader(
                        title: "My Cart",
                        subtitle: "\(items.count) items"
                    )
                    ScrollView {
                        // Donut list
                        LazyVStack {
                            ForEach(items.indices, id: \.self) { index in
                                CartItem(
                                    onDeleteClick: {
                                        /**TODO: */
                                    }
                                )
                                CustomDivider(
                                    color: Color.onBackgroundVariantLight
                                )
                            }
                        }
                    }
                    .frame(maxHeight: metrics.size.height * 0.50)
                    
                    Spacer()
                    
                    // Payment summary card
                    SubtotalSummaryCard(
                        subtotalPrice: "$9.99",
                        deliveryPrice: "$0.00",
                        totalPrice: "$9.99"
                    )
                        
                    Spacer()
                    
                    // Bottom cart buttons/info
                    HStack {
                        // Add to cart
                        AccentButton(
                            text: "Continue to checkout",
                            onClick: {}
                        )
                    }
                    .frame(maxWidth: .infinity,  alignment: .leading)
                    .background(Color.background)
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .padding(PaddingManager.view)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.background)
            .ignoresSafeArea(.all, edges: .bottom)
        }
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
                        .fontWeight(.medium)
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

private struct SubtotalSummaryCard: View {
    let subtotalPrice: String
    let deliveryPrice: String
    let totalPrice: String
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Subtotal Summary")
                    .font(.headline)
                    .fontWeight(.bold)
                SubtotalItemEntry(itemName: "Subtotal", itemPrice: subtotalPrice)
                SubtotalItemEntry(itemName: "Delivery", itemPrice: deliveryPrice)
            }
            CustomDivider(
                color: Color.onBackgroundVariantLight
            )
            HStack {
                Text("Subtotal")
                    .font(.headline)
                    .fontWeight(.bold)
                Spacer()
                Text(totalPrice)
                    .font(.title3)
                    .fontWeight(.bold)
            }
        }
        .padding()
        .background(Color.foreground)
        .cornerRadius(CGFloat.medium)
        .shadow(color: .gray, radius: 3, x: -2, y: 2)
    }
}

private struct SubtotalItemEntry: View {
    let itemName: String
    let itemPrice: String
    var font: Font = .callout
    var weight: Font.Weight = .medium
    var color: Color = Color.onBackgroundVariant
    
    var body: some View {
        HStack {
            Text(itemName)
                .font(font)
                .fontWeight(weight)
                .foregroundColor(color)
            Spacer()
            Text(itemPrice)
                .font(font)
                .fontWeight(weight)
                .foregroundColor(color)
        }
    }
}

struct Cart_Previews: PreviewProvider {
    static var donuts: [Donut] = [
        Donut(name: "Strawberry", price: "$2.00", imageName: "donutStrawberry"),
        Donut(name: "Strawberry", price: "$2.00", imageName: "donutStrawberry"),
        Donut(name: "Strawberry", price: "$2.00", imageName: "donutStrawberry"),
        Donut(name: "Strawberry", price: "$2.00", imageName: "donutStrawberry"),
        Donut(name: "Strawberry", price: "$2.00", imageName: "donutStrawberry"),
        Donut(name: "Strawberry", price: "$2.00", imageName: "donutStrawberry"),
        Donut(name: "Strawberry", price: "$2.00", imageName: "donutStrawberry")
    ]
    
    static var previews: some View {
        CartViewContent(items: donuts)
    }
}
