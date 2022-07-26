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
    var body: some View {
        GeometryReader { metrics in
            ZStack {
                VStack {
                    // Header
                    VStack(alignment: .leading) {
                        Group {
                            Text("Donuts")
                                .font(.largeTitle)
                            Text("Just the good stuff.")
                                .font(.headline)
                        }
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .foregroundColor(Color.onAccent)
                        .padding(.leading, 24)
                        
                        // TODO: Search bar
                    }
                    .frame(
                        maxWidth: .infinity,
                        maxHeight: metrics.size.height * 0.3
                    )
                    .background(Color.accent)
                    .cornerRadius(CGFloat.large, corners: [.bottomLeft])
                    
                    Spacer()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.background)
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeContent()
    }
}
