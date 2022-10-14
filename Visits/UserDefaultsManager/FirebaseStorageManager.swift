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
    
    //MARK: function to upload an image.
    func uploadImage(with path: String, image: UIImage?) {
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
        let fileReference = storageReference.child("\(path)/\(image).jpg")
        
        let _ = fileReference.putData(imageData, metadata: nil) { (metadata, error) in
            guard let _ = metadata else {
                print("Uh-oh, an error occurred while uploading")
                return
            }
        }
    }
}
