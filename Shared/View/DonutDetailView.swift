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
