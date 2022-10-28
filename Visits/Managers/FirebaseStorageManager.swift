//
//  FirebaseStorageManager.swift
//  Visits
//
//  Created by Adarsh Shukla on 12/10/22.
//

import SwiftUI
import FirebaseStorage

class FirebaseStorageManager {
    //singleton
    static let shared = FirebaseStorageManager()
    
    //An instance of StorageReference referencing the root of the storage bucket.
    let storageReference = Storage.storage().reference()
    
    var previousInstance = ""
    var imageFilePaths: [String] = []
}

extension FirebaseStorageManager {
    //MARK: function to upload an image.
    func uploadImage(with path: String, image: UIImage?) async throws {
        //checking if the image is not nil
        guard let image = image else {
            print("The image to be uploaded does not exist.")
            return
        }
        
        //conveting image to data
        let imageData = image.jpegData(compressionQuality: 0.2)
        
        //checking if the data is returned or not.
        guard let imageData = imageData else {
            return
        }
        
        //specifying file name.
        let imageFilePath = "\(path)/\(image).jpg"
        if path == previousInstance {
            imageFilePaths.append(imageFilePath)
        } else {
            imageFilePaths.removeAll()
            imageFilePaths.append(imageFilePath)
            previousInstance = path
        }
        let fileReference = storageReference.child(imageFilePath)
        
        //uploading to storage.
        do {
            let _ = try await fileReference.putDataAsync(imageData, metadata: nil)
            try await DatabaseManager.shared.addImagePath(toDocument: path, imagePaths: self.imageFilePaths)
        } catch  {
            throw error
        }
    }

}
