//
//  HomeView.swift
//  DonutTemplate (iOS)
//
//  Created by Seth Polyniak on 7/26/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        HomeContent()
    }
}

private struct HomeContent: View {
    @State private var searchText: String = ""
    @State private var filter = FilterType.all.rawValue
    
    var body: some View {
        GeometryReader { metrics in
            ZStack {
                VStack {
                    // Header & Search
                    HomeHeader(
                        searchText: $searchText,
                        height: metrics.size.height * 0.3
                    )
                    
                    // Filter cards
                    SegmentedPicker(
                        selection: $filter,
                        titles: FilterType.allCases.map {$0.description}
                    )
                    .padding(.horizontal, 8)
                    
                    let data = (1...8).map { "Item \($0)" }
                    let columns = [
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ]

                    
                    
                    // TODO: Donut cards
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(data, id: \.self) { item in
                                ItemCard()
                                    //.padding(12)
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    Spacer()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.background)
        }
    }
}

private struct HomeHeader: View {
    @Binding var searchText: String
    let height: Double
    var body: some View {
        VStack {
            // Header
            VStack(alignment: .leading) {
                Spacer()
                Group {
                    Text("Donuts")
                        .font(.largeTitle)
                    Text("Just the good stuff.")
                        .font(.headline)
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
            .frame(
                maxWidth: .infinity,
                maxHeight: height
            )
            .background(Color.accent)
            .cornerRadius(CGFloat.large, corners: [.bottomLeft])
        }
    }
}

private struct ItemCard: View {
    var body: some View {
        VStack(alignment: .leading) {
            // TODO: Color: image background
            ZStack{
                Color.secondaryColor
                    .cornerRadius(CGFloat.medium)
                // TODO: Image: item
                Image("donutStrawberry")
            }
            .padding([.horizontal, .top] , 8)
            
            // TODO: Text: Item title
            Text("Some Item Name")
                .foregroundColor(Color.onForeground)
                .fontWeight(.bold)
            .padding(.horizontal, 8)
            
            HStack {
                // TODO: Text: Item price
                Text("$0.00")
                    .foregroundColor(Color.onBackgroundVariant)
                    .fontWeight(.bold)
                
                Spacer()
                
                // TODO: Button: add
                Button(action: {
                    // TODO:
                }) {
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
        HomeContent()
    }
}
