//
//  AuthViewModel.swift
//  Visits
//
//  Created by Adarsh Shukla on 16/08/22.
//

import Foundation
import FirebaseAuth

class AuthViewModel: ObservableObject {
    
    let auth = Auth.auth()
    @Published var signedIn: Bool = false
    
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            DispatchQueue.main.async {
                //successfully signed in.
                self?.signedIn = true
            }
            
        }
    }
    
    func signUp(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            DispatchQueue.main.async {
                //successfully signed in.
                self?.signedIn = true
            }
        }
    }
}
