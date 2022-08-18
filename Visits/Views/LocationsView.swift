//
//  LocationsView.swift
//  Visits
//
//  Created by Adarsh Shukla on 10/08/22.
//

import SwiftUI
import MapKit
import CoreLocationUI

struct LocationsView: View {
    
    @StateObject private var viewModel = LocationsViewModel()
    
    var body: some View {
        ZStack {
            mapLayer
                .ignoresSafeArea()
            
            
            VStack {
                Spacer()
                
                LocationButton(.currentLocation) {
                    viewModel.requestToAllowLocationOnce()
                }
                .foregroundColor(.white)
                .cornerRadius(8)
                .labelStyle(.iconOnly)
                .symbolVariant(.fill)
                .tint(.pink)
                .padding(.bottom, 50)
                
                Text("\(viewModel.currentLocation.longitude)")
                    .padding()
                Text(UserDefaultsManager.shared.getDataFromUserDeafults(forKey: Constants.userType))
            }
        }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
    }
}

extension LocationsView {
    private var mapLayer: some View {
        Map(coordinateRegion: $viewModel.mapRegion,showsUserLocation: true)
    }
}
