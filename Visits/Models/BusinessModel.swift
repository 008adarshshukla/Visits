//
//  BusinessModel.swift
//  Visits
//
//  Created by Adarsh Shukla on 20/08/22.
//

import Foundation
import UIKit

struct BusinessModel: Identifiable, Equatable {
    var id = UUID().uuidString
    var businessType: String
    var businessName: String
    var businessAddress: String
    var latitude: Double
    var longitude: Double
    var images: [UIImage]
}

struct LocationModel: Identifiable, Codable, Equatable {
    var id = UUID().uuidString
    var latitude: Double
    var longitude: Double
}
