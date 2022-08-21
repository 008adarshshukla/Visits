//
//  AdvertiserHomeView.swift
//  Visits
//
//  Created by Adarsh Shukla on 20/08/22.
//

import SwiftUI

struct AdvertiserHomeView: View {
    
    @State private var showProfileButtonAnimation: Bool = false
    @State private var showNewButtonAnimation: Bool = false
    @StateObject private var advertiserViewModel = AdvertiserViewModel()
    
    var body: some View {
        ZStack {
            Color(Constants.backgroundColor)
                .ignoresSafeArea()
            
            NavigationView {
                ScrollView {
                    
                }
                .navigationTitle("Portfolio")
                .navigationBarTitleDisplayMode(.large)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        profileButton
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        newButton
                    }
                }
            }
            
        }
    }
}

struct AdvertiserHomeView_Previews: PreviewProvider {
    static var previews: some View {
        AdvertiserHomeView()
    }
}

extension AdvertiserHomeView {
    private var profileButton: some View {
        Button {
            
        } label: {
            Circle()
                .foregroundColor(.white)
                .frame(width: 50, height: 50)
                .shadow(color: .black.opacity(0.25), radius: 10, x: 0, y: 0)
                .overlay(alignment: .center) {
                    Image(systemName: "person.fill")
                        .font(.headline)
                        .foregroundColor(.black)
                }
        }

    }
    
    private var newButton: some View {
        Button {
            
        } label: {
            Circle()
                .foregroundColor(.white)
                .frame(width: 50, height: 50)
                .shadow(color: .black.opacity(0.25), radius: 10, x: 0, y: 0)
                .overlay(alignment: .center) {
                    Image(systemName: "plus")
                        .font(.headline)
                        .foregroundColor(.black)
                }
        }
        
    }
    
}
