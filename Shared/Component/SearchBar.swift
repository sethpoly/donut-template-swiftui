//
//  SearchBar.swift
//  DonutTemplate
//
//  Created by Seth Polyniak on 7/26/22.
//

import Foundation
import SwiftUI

struct SearchBar: View {
    let placeholder: String
    let backgroundColor: Color = Color(.systemGray6)
    let iconColor: Color = Color.onBackgroundVariant
    let radius: CGFloat = CGFloat.small
    @Binding var text: String
    @State private var isEditing = false
 
    var body: some View {
        HStack {
            
            // Search icon
            Image(systemName: "magnifyingglass")
                .foregroundColor(iconColor)
 
            TextField(placeholder, text: $text)
 
            if isEditing {
                withAnimation {
                    Button(action: {
                        self.isEditing = false
                        self.text = ""
                        UIApplication.shared.dismissKeyboard()
                    }) {
                        Image(systemName: "multiply")
                            .foregroundColor(Color.onBackgroundVariant)
                    }
                    .padding(.trailing, 10)
                    .transition(.move(edge: .trailing))
                }
            }
        }
        .padding(.vertical, 7)
        .padding(.horizontal, 12)
        .background(backgroundColor)
        .cornerRadius(radius)
        .onTapGesture {
            self.isEditing = true
        }
    }
}

struct Searchbar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(placeholder: "placeholder", text: .constant(""))
    }
}
