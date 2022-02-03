//
//  Location.swift
//  EvenlyMap
//
//  Created by Fatemeh Ghanavati  on 31/01/2022.
//

import Foundation
import MapKit


struct Location: Identifiable, Equatable {
    
    //    let id = UUID().uuidString
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let link: String
    var id: String {
        name + cityName
    }
    
    // Equateable
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
    
}
