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
                    HStack(spacing: 16) {
                        RoundedRectangle(cornerRadius: 16)
                            .frame(height: 150)
                            .foregroundColor(.white)
                            .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 0)
                            .overlay(
                                VStack {
                                    Text("Monthly Report")
                                        .font(.headline)
                                        .padding()
                                    HStack(spacing: 0) {
                                        Circle()
                                            .stroke(lineWidth: 3)
                                            .overlay(
                                                Image(systemName: "arrow.down")
                                                    .foregroundColor(.red)
                                                    .font(.largeTitle)
                                            )
                                            .foregroundColor(.red)
                                        Text("26.6%")
                                            .font(.title2)
                                            .foregroundColor(.red)
                                    }
                                    .padding()
                                }
                            )
                            
                        RoundedRectangle(cornerRadius: 16)
                            .frame(height: 150)
                            .foregroundColor(.white)
                            .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 0)
                            .overlay(
                                VStack {
                                    Text("Weekly Report")
                                        .font(.headline)
                                        .padding()
                                    HStack(spacing: 0) {
                                        Circle()
                                            .stroke(lineWidth: 3)
                                            .overlay(
                                                Image(systemName: "arrow.up")
                                                    .foregroundColor(.green)
                                                    .font(.largeTitle)
                                            )
                                            .foregroundColor(.green)
                                        Text("32.4%")
                                            .font(.title2)
                                            .foregroundColor(.green)
                                    }
                                    .padding()
                                }
                            )
                        
                    }
                    .padding()
                    
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
                .foregroundColor(.init(.sRGB, red: 0.9763854146, green: 0.9765252471, blue: 0.9763546586, opacity: 1))
                .frame(width: 45, height: 45)
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
                .foregroundColor(.init(.sRGB, red: 0.9763854146, green: 0.9765252471, blue: 0.9763546586, opacity: 1))
                .frame(width: 45, height: 45)
                .overlay(alignment: .center) {
                    Image(systemName: "plus")
                        .font(.headline)
                        .foregroundColor(.black)
                }
        }
        
    }
    
}
