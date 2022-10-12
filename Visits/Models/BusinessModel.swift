//
//  BusinessModel.swift
//  Visits
//
//  Created by Adarsh Shukla on 20/08/22.
//

import Foundation
import UIKit

struct BusinessModel {
    var businessType: String
    var businessName: String
    var latitude: Double
    var laongitude: Double
    var images: [UIImage]
    var visitMonthly: Int
    var visitWeakly: Int
    var pastVisitMonthly: Int
    var pastVisitWeekly: Int
    var visitsPerMonthForLastSixMonths: [Int]
}

struct LocationModel: Identifiable, Codable, Equatable {
    var id = UUID().uuidString
    var latitude: Double
    var longitude: Double
}
