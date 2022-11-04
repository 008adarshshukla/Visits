//
//  LocalSearchManager.swift
//  Visits
//
//  Created by Adarsh Shukla on 01/11/22.
//

import Foundation
import MapKit
import Combine

class LocalSearchManager: ObservableObject {
    
    @Published var region = MKCoordinateRegion(center: MapDetails.startingLocation, span: MapDetails.defaultSpan)
    let locationsViewModel = LocationsViewModel()
    var cancellables = Set<AnyCancellable>()
    @Published var landmarks: [Landmark] = []
    
    init() {
        locationsViewModel.$region.assign(to: \.region, on: self)
            .store(in: &cancellables)
    }
    
    func searchLocations(withQuery query: String) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        request.region = locationsViewModel.region
        
        let search = MKLocalSearch(request: request)
        search.start { response, error in
            if let response = response {
                let mapItems = response.mapItems
                self.landmarks = mapItems.map {
                    Landmark(placemark: $0.placemark)
                }
            }
        }
    }
}

