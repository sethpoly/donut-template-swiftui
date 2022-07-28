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
