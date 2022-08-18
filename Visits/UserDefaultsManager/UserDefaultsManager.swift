//
//  UserDefaultsManager.swift
//  Visits
//
//  Created by Adarsh Shukla on 18/08/22.
//

import Foundation
import SwiftUI

class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    let userDefault = UserDefaults(suiteName: Constants.suiteName)
    
    func saveToUserDefaults(withKey key: String, value: String) {
        UserDefaultsManager.shared.userDefault?.setValue(value, forKey: key)
    }
    
    func getDataFromUserDeafults(forKey key: String) -> String {
        if let value = UserDefaultsManager.shared.userDefault?.value(forKey: key) as? String {
            return value
        }
        
        return ""
    }
}
