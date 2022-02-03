//
//  LocationViewModel.swift
//  EvenlyMap
//
//  Created by Fatemeh Ghanavati  on 31/01/2022.
//

import SwiftUI
import Combine


class LocationServices: ObservableObject {
    @Published var location: [Location] = []
    var cancellable = Set<AnyCancellable>()

    init() {
      //  getPosts()
    }

    func getPosts() {
     //   guard let url = URL(string: "") else { return }

    }
}
