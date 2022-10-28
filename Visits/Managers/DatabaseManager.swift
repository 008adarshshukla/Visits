//
//  DatabaseManager.swift
//  Visits
//
//  Created by Adarsh Shukla on 14/10/22.
//

import SwiftUI
import FirebaseFirestore

class DatabaseManager {
    //creating a singleton
    static let shared = DatabaseManager()
    
    //intitialising the database
    let database = Firestore.firestore()
}

extension DatabaseManager {
    
    //MARK: function to add imagepaths to a given document
    func addImagePath(toDocument document: String, imagePaths: [String]) async throws {
        
        do {
            try await database.collection("images").document(document).setData(["url" : imagePaths])
            print("image path added successfully.")
        } catch  {
            print("Error adding image path.\(error.localizedDescription)")
            throw error
        }
//        database.collection("images").document(document).setData(["url" : imagePaths]) { error in
//            if let error = error {
//                print("Error adding data.\(error.localizedDescription)")
//                return
//            }
//            print("data successfully added.")
//        }
    }
    
    //MARK: function to retrieve the imagePaths from a given document.
    func retrieveImagePath(from document: String) async throws -> [String]? {
        var imagePaths:[String]?
        do {
            let documentSnapshot = try await database.collection("images").document(document).getDocument()
            let data = documentSnapshot.data()
            let returnedImagePaths = data?["url"] as? [String]
            imagePaths = returnedImagePaths
        } catch  {
            throw error
        }
        return imagePaths
    }
}
