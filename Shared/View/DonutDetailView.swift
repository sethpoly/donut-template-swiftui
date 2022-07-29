//
//  DonutDetailView.swift
//  DonutTemplate
//
//  Created by Seth Polyniak on 7/28/22.
//

import SwiftUI

struct DonutDetailView: View {
    var body: some View {
        DonutDetailContent()
    }
}

private struct DonutDetailContent: View {
    var body: some View {
        ZStack {
            GeometryReader { metrics in
                VStack {
                    // TODO: Button Row - Nav bar
                    // ->
                    
                    // TODO: Image - donut
                    ZStack {
                        Image("donutStrawberry")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: metrics.size.height * 0.45)
                    
                    // TODO: VStack - bottom sheet
                    VStack {
                        // TODO: ->
                        // Item title
                        Text("Donut Name")
                        // Item price
                        Text("$2.00")
                        // Row of additional info
                        HStack {
                            Text("Cal")
                            Text("Stars")
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
                        
                        
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
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

struct PreviewDonutDetail: PreviewProvider {
    static var previews: some View {
        DonutDetailContent()
    }
}
