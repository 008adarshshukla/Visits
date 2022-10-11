//
//  LocationsView.swift
//  Visits
//
//  Created by Adarsh Shukla on 10/08/22.
//

import MapKit
import SwiftUI

struct LocationsView: View {
    
    @StateObject private var viewModel = LocationsViewModel()
    
    
    var body: some View {
        Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
            .ignoresSafeArea()
            .onAppear {
                viewModel.checkIfLocationServicesIsEnable()
            }
        
        
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

