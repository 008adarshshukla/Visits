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
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                LoginView()//change the view here
                if showlaunchScreen {
                    LaunchScreenView()
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                showlaunchScreen = false;
                            }
                        }
                }
            }
        }
    }
}


/*
 App Planning -
 
 1.Loading Screen
 2.Tab View
    Map View of the Locations Visited
        Tapping on the location presents the a sheet showing the deatails of the location.
        
    List View of the locations Visited
        Tapping on the location presents the a sheet showing the deatails of the location.
 */
