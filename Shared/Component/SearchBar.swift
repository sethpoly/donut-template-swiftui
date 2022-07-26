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
    @Binding var text: String
    @State private var isEditing = false
 
    var body: some View {
        HStack {
 
            TextField(placeholder, text: $text)
                .padding(.vertical, 7)
                .padding(.horizontal, 12)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .onTapGesture {
                    self.isEditing = true
                }
 
            if isEditing {
                withAnimation {
                    Button(action: {
                        self.isEditing = false
                        self.text = ""
                        UIApplication.shared.dismissKeyboard()
                    }) {
                        Text("Cancel")
                    }
                    .padding(.trailing, 10)
                    .transition(.move(edge: .trailing))
                }
            }
        }
    }
}
