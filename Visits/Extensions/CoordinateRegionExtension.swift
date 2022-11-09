//
//  CoordinateRegionExtension.swift
//  Visits
//
//  Created by Adarsh Shukla on 09/11/22.
//

import Foundation
import MapKit

extension MKCoordinateRegion {
    static func regionFromLandmark(_ landmark: Landmark) -> MKCoordinateRegion {
        MKCoordinateRegion(center: landmark.coordinates, span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
    }
}
