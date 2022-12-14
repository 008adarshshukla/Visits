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
    @State var currenTab: String = "home"
    @Namespace var animation
    @State var showSideBar: Bool = false
    @EnvironmentObject var localSearchManager: LocalSearchManager
    @State var annotationsDidAppear = false
    @State var viewListButtonTapped = false
    
    var body: some View {
        ZStack {
            ZStack {
                Map(coordinateRegion: $localSearchManager.region, showsUserLocation: true, annotationItems: localSearchManager.landmarks, annotationContent: { landmark in
                    
                    MapAnnotation(coordinate: landmark.coordinates) {
                        LocationMapAnnotationView(imageName: "map.circle.fill")
                            .scaleEffect(localSearchManager.landmark == landmark ? 1.1 : 0.8)
                            .onAppear {
                                annotationsDidAppear = true
                            }
                    }
                })
                .ignoresSafeArea()
                
                searchBar()
            }
            .onTapGesture {
                withAnimation(Animation.easeInOut) {
                    showSideBar = false
                }
            }
            
            ScrollView(showsIndicators: false) {
                SideBar()
            }
            .background(content: {
                Color.white.ignoresSafeArea()
            })
            .offset(x: showSideBar ? -145 : -300)
            
            if annotationsDidAppear {
                VStack {
                    Spacer()
                    listViewButton()
                }
            }
            
            locationListView()
                .offset(y: !viewListButtonTapped ? UIScreen.main.bounds.height : 0)
            
        }
        
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView().environmentObject(LocalSearchManager())
    }
}

extension LocationsView {
    
    //MARK: Search Bar
    @ViewBuilder
    func searchBar() -> some View {
        VStack {
            HStack {
                Button {
                    //present side bar.
                    withAnimation(Animation.easeInOut) {
                        showSideBar = true
                    }
                } label: {
                    Image(systemName: "line.3.horizontal")
                        .font(.title2)
                        .foregroundColor(.black)
                }
                
                TextField("Cafe, Restraunt, School...", text: $searchedLocation)
                
                Button {
                    //search.
                    localSearchManager.searchLocations(withQuery: searchedLocation)
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
    
    //MARK: Side Bar
    @ViewBuilder
    func SideBar() -> some View {
        
        //MARK: Tabs
        let tabs: [String] = [
            "home",
            "bakery",
            "cafe",
            "carRental",
            "fitnessCenter",
            "hospital",
            "hotel",
            "laundry",
            "movieTheater",
            "pharmacy",
            "restaurant",
            "store",
            "university"
        ]
        
        VStack(spacing: 10) {
            Image("LogoImage")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 55, height: 55)
                .padding(.bottom, 10)
            
            ForEach(tabs, id: \.self) { tab in
                VStack(spacing: 8) {
                    Image("\(tab)")
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 22)
                    Text(tab.capitalized)
                        .font(.caption)
                        .fontWeight(.semibold)
                }
                .foregroundColor(currenTab == tab ? Color.orange : Color.gray)
                .padding(.vertical, 13)
                .frame(width: 100)
                .background {
                    if currenTab == tab {
                        RoundedRectangle(cornerRadius: 15, style: .continuous)
                            .fill(Color.orange.opacity(0.3))
                            .padding(.horizontal, 6)
                            .matchedGeometryEffect(id: "TAB", in: animation)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        currenTab = tab
                        searchedLocation = tab.capitalized
                    }
                }
            }
            
            Button {
                
            } label: {
                VStack {
                    Image("user")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 45, height: 45)
                        .clipShape(Circle())
                    Text("Profile")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                }
            }
            .padding(.top, 20)
        }
        .padding(.vertical)
        .frame(maxHeight: .infinity, alignment: .top)
        .frame(width: 100)
        .background {
            Color.white
                .ignoresSafeArea()
        }
    }
    
    //MARK: List View Button
    @ViewBuilder
    func listViewButton() -> some View {
        Button {
            //show the list view
            withAnimation(Animation.easeInOut) {
                viewListButtonTapped = true
            }
        } label: {
            HStack {
                Image(systemName: "list.bullet.rectangle.portrait")
                    .resizable()
                    .foregroundColor(.black)
                    .frame(width: 20, height: 20)
                Text("View List")
                    .font(.headline)
                    .foregroundColor(.black)
            }
            .padding()
            .background {
                Capsule()
                    .foregroundColor(.white.opacity(0.8))
            }
        }
    }
    
    //MARK: Location List View
    @ViewBuilder
    func locationListView() -> some View {
        VStack {
            HStack {
                Text(searchedLocation)
                    .foregroundColor(.black)
                    .font(.title)
                    .fontWeight(.semibold)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(.gray.opacity(0.2))
            List {
                Section {
                    ForEach(localSearchManager.landmarks) { landmark in
                        HStack {
                            Text(landmark.name)
                            Spacer()
                            Image(systemName: "info.circle.fill")
                                .foregroundColor(.gray.opacity(0.8))
                        }
                        .onTapGesture {
                            withAnimation(Animation.easeInOut) {
                                localSearchManager.landmark = landmark
                                localSearchManager.region = MKCoordinateRegion.regionFromLandmark(landmark)
                                viewListButtonTapped = false
                            }
                        }
                    }
                } header: {
                    Text("Nearby \(searchedLocation)")
                        .font(.headline)
                        .fontWeight(.semibold)
                }
                
            }
            .listStyle(.plain)
        }
        .background(.white)
    }
}


