//
//  EvenlyMapApp.swift
//  EvenlyMap
//
//  Created by Fatemeh Ghanavati  on 31/01/2022.
//

import SwiftUI

@main
struct EvenlyMapApp: App {
    
    @StateObject private var vm = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            if #available(iOS 15.0, *) {
                LocationsView()
                    .environmentObject(vm)
            } else {
                // Fallback on earlier versions
            }
        }
    }
}
