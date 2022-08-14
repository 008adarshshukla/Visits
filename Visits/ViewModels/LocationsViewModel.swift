//
//  LocationsViewModel.swift
//  Visits
//
//  Created by Adarsh Shukla on 10/08/22.
//

import SwiftUI
import CoreLocation
import MapKit

enum MapDetails {
    static let startingLocation = CLLocationCoordinate2D(latitude: 40, longitude: 120)
    static let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
}

final class LocationsViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var mapRegion = MKCoordinateRegion(
        center: MapDetails.startingLocation,
        span: MapDetails.span)
    
    let locationManager = CLLocationManager()
    var currentLocation: CLLocationCoordinate2D = MapDetails.startingLocation
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    func requestToAllowLocationOnce() {
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let latestLocation = locations.first else {
            return
        }
        
        DispatchQueue .main.async {
            self.mapRegion = MKCoordinateRegion(center: latestLocation.coordinate, span: MapDetails.span)
            self.currentLocation = latestLocation.coordinate
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}

extension LocationsViewModel {
    //getting nearby places using MapKit.
    func getNearByLandmarks() {
        
    }
}
 
