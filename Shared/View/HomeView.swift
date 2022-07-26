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
    
    var body: some View {
        GeometryReader { metrics in
            ZStack {
                HomeHeader(
                    searchText: $searchText,
                    height: metrics.size.height * 0.3
                )
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
            
            Spacer()
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeContent()
    }
}