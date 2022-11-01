//
//  LocationsViewModel.swift
//  Visits
//
//  Created by Adarsh Shukla on 10/08/22.
//

import MapKit

enum MapDetails {
    static let startingLocation = CLLocationCoordinate2D(latitude: 37.331516, longitude: -121.891054)
    static let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
}

final class LocationsViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.requestLocation()
    }
    
    @Published var region = MKCoordinateRegion(center: MapDetails.startingLocation, span: MapDetails.defaultSpan)
    
    
    //Function that check the user location permission, its private because only functions inside this class can have access to this function
    private func checkLocationAuthorization() {
        //Switch case to determine the authorization of the user about the location of it
        switch locationManager.authorizationStatus {
        
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Your current location in restricted")
        case .denied:
            print("You have denied this app location permission. Go to the settings to change it.")
        case .authorizedAlways, .authorizedWhenInUse:
            guard let location = locationManager.location else { return }
            region = MKCoordinateRegion(
                center: location.coordinate,
                span: MapDetails.defaultSpan)
            
        @unknown default:
            break
        }

    }
    
    //Function created to verify if the user location permission did change
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }
        DispatchQueue.main.async { [weak self] in
            self?.region = MKCoordinateRegion(center: location.coordinate, span: MapDetails.defaultSpan)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}
