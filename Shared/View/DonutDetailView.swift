//
//  DonutDetailView.swift
//  DonutTemplate
//
//  Created by Seth Polyniak on 7/28/22.
//

import SwiftUI

struct DonutDetailView: View {
    var body: some View {
        DonutDetailContent(donut: Donut(name: "", price: "", imageName: ""))
    }
}

private struct DonutDetailContent: View {
    let donut: Donut
    
    var body: some View {
        ZStack {
            GeometryReader { metrics in
                VStack {
                    // TODO: Button Row - Nav bar
                    // ->
                    
                    // TODO: Image - donut
                    ZStack {
                        Image(donut.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: metrics.size.height * 0.45)
                    
                    // TODO: VStack - bottom sheet
                    ScrollView {
                    VStack(alignment: .leading, spacing: 12) {
                        // Item title
                        Text(donut.name)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color.onBackground)
                        
                        // Item price
                        Text(donut.price)
                            .font(.title2)
                            .foregroundColor(Color.onBackground)
                        
                        // Additional info
                        HStack(spacing: 24) {
                            ForEach(donut.additionalInfoEntries, id: \.id) { item in
                                AdditionalInfoEntryView(item: item)
                            }
                        }
                        
                        // Description & other information
                        VStack(alignment: .leading, spacing: 16) {
                            // Description
                            VStack(alignment: .leading) {
                                SectionHeader(header: "Description")
                                Text("Drizzled with homemade strawberry frosting, and topped with crisp rainbow sprinkles. A true classic.")
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                            
                            // Ingredients
                            VStack(alignment: .leading) {
                                SectionHeader(header: "Ingredients")
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 8) {
                                        ForEach(donut.ingredients, id: \.self) {
                                            IngredientCard(ingredientName: $0.description)
                                        }
                                    }
                                }
                            }
                        }
                        
                        // Bottom cart buttons/info
                        GeometryReader { geometry in
                            ZStack(alignment: .center) {
                                HStack {
                                    QuantityButton()
                                        .frame(maxWidth: geometry.size.width * 0.33)
                                    
                                    // Add to cart
                                    AccentButton(
                                        text: "Add To Cart",
                                        onClick: {}
                                    )
                                }
                            }
                            .frame(maxWidth: .infinity)
                        }
                        Spacer()
                    }
                    .padding(24)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    .background(Color.background)
                    .cornerRadius(CGFloat.large, corners: [.topLeft, .topRight])
                    .ignoresSafeArea(.all, edges: .bottom)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.secondaryColor)
    }
}

private struct AdditionalInfoEntryView: View {
    let item: AdditionalInfoEntry
    var body: some View {
        HStack(spacing: 2) {
            Image(systemName: item.type.imageName)
            Text(item.value.description)
            Text(item.type.description)
        }
        .foregroundColor(Color.accent)
    }
}

private struct SectionHeader: View {
    let header: String
    var body: some View {
        Text(header)
            .foregroundColor(Color.onBackground)
            .font(.title3)
    }
}

private struct IngredientCard: View {
    let ingredientName: String
    var body: some View {
        Text(ingredientName)
            .padding(8)
            .padding(.horizontal, 24)
            .foregroundColor(Color.onBackground)
            .background(Color.onBackgroundVariantLight)
            .cornerRadius(CGFloat.large)
    }
}

private struct QuantityButton: View {
    var body: some View {
        // Quantity
        Button(action: {}) {
            HStack {
                Text("-")
                Spacer()
                Text("1")
                Spacer()
                Text("+")
            }
            .foregroundColor(Color.onBackground)
        }
        .padding()
        .background(Color.onBackgroundVariantLight)
        .cornerRadius(CGFloat.medium)
    }
}

struct PreviewDonutDetail: PreviewProvider {
    static let donut = Donut(
        name: "Strawberry Frosted",
        price: "$2.00",
        imageName: ImageManager.imageDonutStrawberry,
        additionalInfoEntries: [
            AdditionalInfoEntry(type: .stars, value: 4.3),
            AdditionalInfoEntry(type: .calories, value: 349)
        ],
        ingredients: Ingredient.allCases
    )
    
    static var previews: some View {
        DonutDetailContent(donut: donut)
    }
}
