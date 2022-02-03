//
//  LocationsDataService.swift
//  EvenlyMap
//
//  Created by Fatemeh Ghanavati  on 31/01/2022.
//

import Foundation
import MapKit


class LocationsDataService: ObservableObject {
    static let locations: [Location] = [
        Location(
            name: "Evenly HQ",
            cityName: "Berlin",
            coordinates: CLLocationCoordinate2D(latitude: 52.500342, longitude: 13.425170),
            link: "https://linktr.ee/evenlyio"),
        Location(
            name: "Brandenburg",
            cityName: "Rome",
            coordinates: CLLocationCoordinate2D(latitude: 52.3792737, longitude: 13.451477),
            link: "https://www.google.it"),
        Location(
            name: "Home",
            cityName: "Rome",
            coordinates: CLLocationCoordinate2D(latitude: 41.8954656, longitude: 12.416454),
            link: "https://www.google.it"),
    ]
}
