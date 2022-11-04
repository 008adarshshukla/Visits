//
//  AdvertiserFormView.swift
//  Visits
//
//  Created by Adarsh Shukla on 11/10/22.
//

import SwiftUI
import MapKit
import PhotosUI

@available(iOS 16.0, *)
struct AdvertiserFormView: View {
    
    let services: [String] = ["bakery",
                              "cafe",
                              "carRental",
                              "fitnessCenter",
                              "hospital",
                              "hotel",
                              "laundry",
                              "movieTheater",
                              "pharmacy",
                              "restaurant",
                              "school",
                              "store",
                              "university"]
    
    @State var businessType: String = ""
    @State var businessName: String = ""
    @State var businessAddress: String = ""
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 23.145563, longitude: 72.629904), span: MKCoordinateSpan(latitudeDelta: 0.019, longitudeDelta: 0.019))
    @State var latitude: Double = 0.0
    @State var longitude: Double = 0.0
    @State private var locations = [LocationModel]()
    @State var selectedItemsFromGallery: [PhotosPickerItem] = []
    @State var selectedImages: [UIImage] = []
    
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
                        if selectedImages.count > 0 {
                            TabView {
                                ForEach(selectedImages, id: \.self) { image in
                                    Image(uiImage: image)
                                        .resizable()
                                }
                            }
                            .frame(width: UIScreen.main.bounds.width -
                                   30, height: 350)
                            .cornerRadius(10)
                            .tabViewStyle(.page)
                        } else {
                            Image(systemName: "photo.circle.fill")
                                .resizable()
                                .foregroundColor(.gray.opacity(0.8))
                                .frame(width: 200, height: 200)
                                .overlay(alignment: .bottomTrailing) {
                                    PhotosPicker(selection: $selectedItemsFromGallery, matching: .any(of: [.images, .not(.livePhotos)])) {
                                        Circle()
                                            .foregroundColor(.mint)
                                            .frame(width: 50, height: 50)
                                            .overlay(alignment: .center) {
                                                Image(systemName: "plus")
                                                    .font(.title)
                                            }
                                    }
                                    .onChange(of: selectedItemsFromGallery) { newValues in
                                        selectedImages = []
                                        for value in newValues {
                                            Task{
                                                if let imageData = try? await value.loadTransferable(type: Data.self), let image = UIImage(data: imageData) {
                                                    selectedImages.append(image)
                                                }
                                            }
                                        }
                                    }
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
                        
                        
                        submitButton()
                        
                    }
                }
            }
        }
    }
}

@available(iOS 16.0, *)
struct AdvertiserFormView_Previews: PreviewProvider {
    static var previews: some View {
        AdvertiserFormView()
    }
}

@available(iOS 16.0, *)
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
                    LocationMapAnnotationView(imageName: "map.circle.fill")
                }
            }
            
            
            LocationMapAnnotationView(imageName: "map.circle.fill")
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        //adding a new location
                        latitude = mapRegion.center.latitude
                        longitude = mapRegion.center.longitude
                        let newLocation = LocationModel(latitude: mapRegion.center.latitude, longitude: mapRegion.center.longitude)
                        locations.append(newLocation)
                    } label: {
                        Image(systemName: "plus")
                    }
                    .padding()
                    .background(.red.opacity(0.6))
                    .foregroundColor(.white)
                    .font(.title2)
                    .clipShape(Circle())
                    .padding(.trailing)
                }
            }
            
        }
    }
    
    //MARK: Submit Button
    @ViewBuilder
    func submitButton() -> some View {
        Button {
            let newBusiness = BusinessModel(businessType: businessType, businessName: businessName, businessAddress: businessAddress, latitude: latitude, longitude: longitude, images: selectedImages)
            //performing task of uploading each images to the sorage and its corresponding address to the firestore.
            Task {
                for image in selectedImages {
                    do {
                        try await FirebaseStorageManager.shared.uploadImage(with: "\(newBusiness.businessName)\(newBusiness.businessAddress)", image: image)
                    } catch  {
                        print("Uh-oh, an error occurred while uploading")
                    }
                }
            }
        } label: {
            Text("Submit")
                .foregroundColor(.white)
                .font(.title2)
                .fontWeight(.semibold)
                .frame(height: 40)
                .frame(maxWidth: .infinity)
                .background {
                    Capsule()
                        .foregroundColor(.red.opacity(09))
                }
                .padding()
        }
    }
}

