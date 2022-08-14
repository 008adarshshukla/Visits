//
//  VisitsApp.swift
//  Visits
//
//  Created by Adarsh Shukla on 31/07/22.
//

import SwiftUI

@main
struct VisitsApp: App {
    
    @State private var showlaunchScreen: Bool = true
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                LocationsView()
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
