//
//  LandmarkModel.swift
//  Visits
//
//  Created by Adarsh Shukla on 02/11/22.
//

import Foundation
import MapKit

struct Landmark: Identifiable, Hashable {
    let placemark: MKPlacemark
    let id = UUID()
    var name: String {
        self.placemark.name ?? ""
    }
    var title: String {
        self.placemark.title ?? ""
    }
    var coordinates: CLLocationCoordinate2D {
        self.placemark.coordinate
    }
}
