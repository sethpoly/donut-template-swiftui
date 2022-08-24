//
//  HomeView.swift
//  DonutTemplate (iOS)
//
//  Created by Seth Polyniak on 7/26/22.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject private var homeViewModel = HomeViewModel()
    var body: some View {
        HomeContent(
            donuts: homeViewModel.donuts,
            onAddToCart: {
                homeViewModel.addToCart(itemId: $0)
            }
        )
    }
}

private struct HomeContent: View {
    let donuts: [Donut]
    let onAddToCart: (String) -> Void
    @State private var searchText: String = ""
    @State private var filter = FilterType.all.rawValue
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        GeometryReader { metrics in
            ZStack {
                VStack {
                    // Header & Search
                    HomeHeader(
                        searchText: $searchText
                    )
                    .frame(
                        maxWidth: .infinity,
                        maxHeight: metrics.size.height * 0.3
                    )
                    
                    // Filter cards
                    SegmentedPicker(
                        selection: $filter,
                        titles: FilterType.allCases.map {$0.description}
                    )
                    .padding(.horizontal, 8)
                    
                    // Donut card list
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(donuts, id: \.id) { item in
                                ItemCard(
                                    donut: item,
                                    onAddClick: {
                                        onAddToCart($0)
                                    }
                                )
                            }
                        }
                    }
                    .padding(.horizontal, 8)
                    Spacer()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.background)
            .ignoresSafeArea(.all, edges: .bottom)
            .customNavigationBar(
                leadingButtonImage: ImageManager.hamburgerMenu,
                leadingButtonAction: {/*TODO: */},
                trailingButtonImage: ImageManager.cart,
                trailingButtonAction: {/*TODO: Nav to cart view*/})
        }
    }
}

private struct HomeHeader: View {
    @Binding var searchText: String
    var body: some View {
        VStack {
            // Header
            VStack(alignment: .leading) {
                Spacer()
                Group {
                    Text("Donuts")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text("Just the good stuff.")
                        .font(.title2)
                }
                .frame(maxWidth: .infinity,alignment: .leading)
                .foregroundColor(Color.onAccent)
                .padding(.horizontal, 24)
                Spacer()
                
                // Search bar
                SearchBar(
                    placeholder: "Search all donuts",
                    text: $searchText
                )
                .padding(.horizontal, 24)

            }
            .padding(.vertical, 24)
            .background(Color.accent)
            .cornerRadius(CGFloat.large, corners: [.bottomLeft])
            .ignoresSafeArea(.all, edges: .top)
        }
    }
}

private struct ItemCard: View {
    let donut: Donut
    let onAddClick: (String) -> Void
    var body: some View {
        VStack(alignment: .leading) {
            // Image + background
            ZStack{
                Color.secondaryColor
                    .cornerRadius(CGFloat.medium)
                // Image
                Image(donut.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .padding([.horizontal, .top] , 8)
            
            // Item title
            Text(donut.name)
                .foregroundColor(Color.onForeground)
                .fontWeight(.bold)
            .padding(.horizontal, 8)
            
            HStack {
                // Item price
                Text(donut.price)
                    .foregroundColor(Color.onBackgroundVariant)
                    .fontWeight(.bold)
                
                Spacer()
                
                // Button: add
                Button(action: { onAddClick(donut.id) }) {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 32, maxHeight: 32)
                        .foregroundColor(Color.accent)
                }
            }
            .padding([.horizontal, .bottom], 8)
        }
        .background(Color.foreground)
        .cornerRadius(CGFloat.medium)
        .shadow(color: .gray, radius: 3, x: -2, y: 2)
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeContent(
            donuts: [
                Donut(name: "Strawberry", price: "$2.00", imageName: "donutStrawberry"),
                Donut(name: "Strawberry", price: "$2.00", imageName: "donutStrawberry"),
                Donut(name: "Strawberry", price: "$2.00", imageName: "donutStrawberry"),
                Donut(name: "Strawberry", price: "$2.00", imageName: "donutStrawberry"),
                Donut(name: "Strawberry", price: "$2.00", imageName: "donutStrawberry")
            ],
            onAddToCart: { _ in }
        )
    }
}
