//
//  LocationsView.swift
//  Visits
//
//  Created by Adarsh Shukla on 10/08/22.
//

import MapKit
import SwiftUI

struct LocationsView: View {
    
    @StateObject private var viewModel = LocationsViewModel()
    @State var searchedLocation: String = ""
    
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
                .ignoresSafeArea()
            
            searchBar()
        }
        
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
    }
}

extension LocationsView {
    @ViewBuilder
    func searchBar() -> some View {
        VStack {
            HStack {
                Button {
                    //present side bar.
                } label: {
                    Image(systemName: "line.3.horizontal")
                        .font(.title2)
                        .foregroundColor(.black)
                }
                
                TextField("Cafe, Restraunt, School...", text: $searchedLocation)
                
                Button {
                    //search.
                } label: {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .foregroundColor(.black)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 22, height: 22)
                }
                
            }
            .padding()
            .background {
                Capsule()
                    .foregroundColor(.white)
            }
            .padding()
            
            Spacer()
        }
    }
}

