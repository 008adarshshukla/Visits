//
//  VisitsApp.swift
//  Visits
//
//  Created by Adarsh Shukla on 31/07/22.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct VisitsApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @State private var showlaunchScreen: Bool = true
    @StateObject private var authViewModel = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                if authViewModel.isSignedIn {
                    LocationsView()
                } else {
                    AuthenticationView()
                }
                
                if showlaunchScreen {
                    LaunchScreenView()
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                showlaunchScreen = false
                            }
                        }
                }
            }
        }
    }
}


//App flow
/*
 1. shows the launch screen for every launch
 2. authntication view appaers if the user is not authenticated.
 3. map view appears directly if the user is authenticated.
 */
