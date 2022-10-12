//
//  AdvertiserFormView.swift
//  Visits
//
//  Created by Adarsh Shukla on 11/10/22.
//

import SwiftUI
import MapKit

struct AdvertiserFormView: View {
    
    let services: [String] = ["Hospital", "Hotel", "Police Station", "Restaurant", "Multiplex", "Education Center", "Mall", "Pharmacy"]
    @State var businessType: String = ""
    @State var businessName: String = ""
    @State var businessAddress: String = ""
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 23.145563, longitude: 72.629904), span: MKCoordinateSpan(latitudeDelta: 0.019, longitudeDelta: 0.019))
    @State var latitude: Double = 0.0
    @State var longitude: Double = 0.0
    @State private var locations = [LocationModel]()
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.08)
                .ignoresSafeArea()
            
            VStack {
                Text("Business Details")
                    .font(.title2)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .padding(.leading)
                ScrollView {
                    VStack {
                        Image(systemName: "photo.circle.fill")
                            .resizable()
                            .foregroundColor(.gray.opacity(0.8))
                            .frame(width: 200, height: 200)
                            .overlay(alignment: .bottomTrailing) {
                                Circle()
                                    .foregroundColor(.mint)
                                    .frame(width: 50, height: 50)
                                    .overlay(alignment: .center) {
                                        Image(systemName: "plus")
                                            .font(.title)
                                    }
                            }
                        selectBusinessType()
                        getBusinessName()
                        getBusinessAddress()
                        Text("Select the Location")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal)
                        locateOnMap()
                            .cornerRadius(10)
                            .frame(width: UIScreen.main.bounds.width -
                                   30, height: 400)
                            .padding()
                    }
                }
            }
        }
    }
}

struct AdvertiserFormView_Previews: PreviewProvider {
    static var previews: some View {
        AdvertiserFormView()
    }
}

extension AdvertiserFormView {
    
    //MARK: Selecting a Business Type.
    @ViewBuilder
    func selectBusinessType() -> some View {
        HStack {
            TextField("Choose a business...", text: $businessType)
                .padding(.horizontal)
            Menu {
                ForEach(services, id: \.self){ service in
                    Button(service) {
                        self.businessType = service
                    }
                }
            } label: {
                Image(systemName: "chevron.down")
                    .padding(.horizontal, 10)
            }
        }
        .frame(height: 40)
        .background {
            Capsule()
                .foregroundColor(.white)
        }
        .padding()
    }
    
    //MARK: Business Name.
    @ViewBuilder
    func getBusinessName() -> some View {
        HStack {
            TextField("Enter business name...", text: $businessName)
                .padding(.horizontal)
        }
        .frame(height: 40)
        .background {
            Capsule()
                .foregroundColor(.white)
        }
        .padding(.horizontal)
    }
    
    //MARK: Business Address.
    @ViewBuilder
    func getBusinessAddress() -> some View {
        HStack {
            TextField("Enter business address...", text: $businessAddress)
                .padding(.horizontal)
        }
        .frame(height: 40)
        .background {
            Capsule()
                .foregroundColor(.white)
        }
        .padding()
    }
    
    //MARK: Locate on map
    @ViewBuilder
    func locateOnMap() -> some View {
        ZStack {
            Map(coordinateRegion: $mapRegion, annotationItems: locations) { location in
                MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)) {
                    LocationMapAnnotationView()
                }            }
            
            LocationMapAnnotationView()
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        //adding a new location
                        let newLocation = LocationModel(latitude: mapRegion.center.latitude, longitude: mapRegion.center.longitude)
                        locations.append(newLocation)
                    } label: {
                        Image(systemName: "plus")
                    }
                    .padding()
                    .background(.black.opacity(0.75))
                    .foregroundColor(.white)
                    .font(.title2)
                    .clipShape(Circle())
                    .padding(.trailing)
                }
            }
            
        }
    }
}
