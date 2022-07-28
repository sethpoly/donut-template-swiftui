//
//  UIApplication+Extension.swift
//  DonutTemplate
//
//  Created by Seth Polyniak on 7/26/22.
//

import Foundation
import UIKit

extension UIApplication {
    func dismissKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
