//
//  UIApplication.swift
//  EvenlyMap
//
//  Created by Fatemeh Ghanavati  on 31/01/2022.
//

import SwiftUI
import SwiftUI


extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
