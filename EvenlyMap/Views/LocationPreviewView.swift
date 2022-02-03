//
//  LocationPreviewViw.swift
//  EvenlyMap
//
//  Created by Fatemeh Ghanavati  on 31/01/2022.
//


import SwiftUI


struct LocationPreviewView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    let location: Location
    
    var body: some View {
        
        HStack(alignment: .center, spacing: 0) {
            VStack(alignment: .leading, spacing: 16.0) {
                titleSection
            }
            VStack(alignment: .trailing, spacing: 16.0) {
                shareButton
                nextButton
            }
        }
        .padding(20)
    }
}


struct LocationPreviewViw_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            LocationPreviewView(location: LocationsDataService.locations.first!)
                .padding()
        }
        .environmentObject(LocationsViewModel())
    }
}


extension LocationPreviewView {
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(location.name)
                .font(.title)
                .fontWeight(.bold)
            
            Text(location.cityName)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var shareButton: some View {
        Button {
            vm.shareButon()
        } label: {
            Image(systemName: "paperplane.fill")
                .font(.headline)
                .foregroundColor(Color.black)
                .frame(width: 50, height: 50)
                .background(
                    Circle()
                        .foregroundColor(Color.white)
                )
                .shadow(color: Color.black.opacity(0.25), radius: 10, x: 0, y: 0)
                .padding()
                .font(.headline)
                .frame(width: 50, height: 50)
        }
    }
    
    private var nextButton: some View {
        Button {
            vm.nextButtonPressed()
        } label: {
            Image(systemName: "arrowshape.zigzag.forward.fill")
                .font(.headline)
                .foregroundColor(Color.black)
                .frame(width: 50, height: 50)
                .background(
                    Circle()
                        .foregroundColor(Color.white)
                )
                .shadow(color: Color.black.opacity(0.25), radius: 10, x: 0, y: 0)
                .padding()
                .font(.headline)
                .frame(width: 50, height: 50)
        }
    }
}
