//
//  LocationsViewModel.swift
//  EvenlyMap
//
//  Created by Fatemeh Ghanavati  on 31/01/2022.
//

import Foundation
import MapKit
import SwiftUI
import Combine



class LocationsViewModel: ObservableObject {
    
    // All loaded locaions
    @Published var locations: [Location]
    @Published var searchText: String = ""
    
    
    
    // Current location on map
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    private let locationViewModel = LocationServices()
    private var cancellables = Set<AnyCancellable>()
    
    

    
    // Current region on map
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location: Location) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(center: location.coordinates, span: mapSpan)
        }
        
    }
   
 
    
    func addSearchBar() {
        $searchText
            .combineLatest(locationViewModel.$location)
            .map { (text, startingLocations) -> [Location] in
                
                guard !text.isEmpty else {
                    return startingLocations
                }
                
                let lowercasedText = text.lowercased()
                return startingLocations.filter { (location) -> Bool in
                    return location.name.lowercased().contains(lowercasedText)
                }
            }
            .sink { [weak self] (returnedLocation) in
                self?.locations = returnedLocation
            }
            .store(in: &cancellables)
    }

    
    func shareButon() {
        guard let data = URL(string: "https://www.google.com/") else { return }
        let av = UIActivityViewController(activityItems: [data], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(av, animated: true, completion: nil)
        
    }
    
    func showNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            
        }
    }
    
    
    private func filterLocations(text: String, location: [Location]) -> [Location] {
        guard !text.isEmpty else {
            return location
        }
        
        let lowercasedText = text.lowercased()
        
        return location.filter { (location) -> Bool in
            return location.name.lowercased().contains(lowercasedText)
        }
    }
    
    
    func nextButtonPressed() {
        guard let currentIndex = locations.firstIndex(where: { $0 == mapLocation}) else {
            print("Could not find current index")
            return
        }
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else {
            guard let firstLocation = locations.first else { return }
            showNextLocation(location: firstLocation)
            return
        }
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
    }
}
