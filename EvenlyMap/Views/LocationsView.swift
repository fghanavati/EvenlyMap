//
//  LocationsView.swift
//  EvenlyMap
//
//  Created by Fatemeh Ghanavati  on 31/01/2022.
//

import SwiftUI
import MapKit




struct LocationsView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        ZStack {
            mapLayer
                .ignoresSafeArea()
            VStack(alignment: .trailing, spacing: 0) {
                header
                    .padding()
                Spacer()
                locationPreviewStack
            }
        }
    }
}


struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
            .environmentObject(LocationsViewModel())
    }
}


extension LocationsView {
    private var header: some View {
        VStack {
           SearchBarView(searchText: $vm.searchText)
        }
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
    }
    private var mapLayer: some View {
        Map(coordinateRegion: $vm.mapRegion, annotationItems: vm.locations, annotationContent: { location in
            MapMarker(coordinate:  location.coordinates, tint: .blue)
        })
    }
    
    private var locationPreviewStack: some View {
        ZStack {
            ForEach(vm.locations) { location in
                if vm.mapLocation == location {
                    LocationPreviewView(location: location)
                        .shadow(color: Color.black.opacity(0.3), radius: 20)
                        .padding()
                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                }
            }
        }
    }
}
