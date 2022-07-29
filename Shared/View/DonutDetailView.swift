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
                    VStack(alignment: .leading, spacing: 8) {
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
                        // Description header
                        Text("Description")
                        // Description body
                        Text("Description body")
                        // Ingredients header
                        Text("Ingredients")
                        // Ingredients cards
                        HStack {
                            Text("ing1")
                            Text("ing2")
                            Text("ing3")
                        }
                        HStack {
                            // Quantity
                            Button(action: {}) {
                                Text("Quantity")
                            }
                            // Add to cart
                            Button(action: {}) {
                                Text("Add To Cart")
                            }
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

struct PreviewDonutDetail: PreviewProvider {
    static let donut = Donut(
        name: "Strawberry Frosted",
        price: "$2.00",
        imageName: ImageManager.imageDonutStrawberry,
        additionalInfoEntries: [
            AdditionalInfoEntry(type: .stars, value: 4.3),
            AdditionalInfoEntry(type: .calories, value: 349)
        ]
    )
    
    static var previews: some View {
        DonutDetailContent(donut: donut)
    }
}
