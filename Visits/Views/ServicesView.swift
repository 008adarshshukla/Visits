//
//  ServicesView.swift
//  Visits
//
//  Created by Adarsh Shukla on 19/08/22.
//

import SwiftUI

@available(iOS 16.0, *)
struct ServicesView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                Grid {
                    GridRow {
                        hospitalButton
                            .padding()
                        hotelButton
                            .padding()
                    }
                    GridRow {
                        pharmacyButton
                            .padding()
                        restaurantButton
                            .padding()
                    }
                    GridRow {
                        multiplexButton
                            .padding()
                        mallButton
                            .padding()
                    }
                    GridRow {
                        policeStationButton
                            .padding()
                        educationCenterButton
                            .padding()
                    }
                }
            }
            .navigationTitle(Text("Explore Services"))
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

@available(iOS 16.0, *)
struct ServicesView_Previews: PreviewProvider {
    static var previews: some View {
        ServicesView()
    }
}

@available(iOS 16.0, *)
extension ServicesView {
    
    //MARK: Hospital Button
    private var hospitalButton: some View {
        Button {
            
        } label: {
            VStack(spacing: 0) {
                Image(Constants.hospitalImage)
                    .resizable()
                    .frame(height: 200)
                    .cornerRadius(16)
                Text("Hospital")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .fontWeight(.medium)
            }
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .foregroundColor(.white)
                    .shadow(color: .black.opacity(0.5), radius: 5, x: 0, y: 0)
            )
        }
        
    }
    
    
    //MARK: Hotel Button
    private var hotelButton: some View {
        Button {
            
        } label: {
            VStack(spacing: 0) {
                Image(Constants.hotelImage)
                    .resizable()
                    .frame(height: 200)
                    .cornerRadius(16)
                Text("Hotel")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .fontWeight(.medium)
            }
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .foregroundColor(.white)
                    .shadow(color: .black.opacity(0.5), radius: 5, x: 0, y: 0)
            )
        }
        
    }
    
    
    //MARK: Police Station Button
    private var policeStationButton: some View {
        Button {
            
        } label: {
            VStack(spacing: 0) {
                Image(Constants.policeStationImage)
                    .resizable()
                    .frame(height: 200)
                    .cornerRadius(16)
                Text("Police Station")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .fontWeight(.medium)
            }
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .foregroundColor(.white)
                    .shadow(color: .black.opacity(0.5), radius: 5, x: 0, y: 0)
            )
        }
        
    }
    
    
    //MARK: Restaurant Button
    private var restaurantButton: some View {
        Button {
            
        } label: {
            VStack(spacing: 0) {
                Image(Constants.restaurantImage)
                    .resizable()
                    .frame(height: 200)
                    .cornerRadius(16)
                Text("Restaurant")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .fontWeight(.medium)
            }
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .foregroundColor(.white)
                    .shadow(color: .black.opacity(0.5), radius: 5, x: 0, y: 0)
            )
        }
        
    }
    
    
    //MARK: Multiplex Button
    private var multiplexButton: some View {
        Button {
            
        } label: {
            VStack(spacing: 0) {
                Image(Constants.multiplexImage)
                    .resizable()
                    .frame(height: 200)
                    .cornerRadius(16)
                Text("Multiplex")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .fontWeight(.medium)
            }
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .foregroundColor(.white)
                    .shadow(color: .black.opacity(0.5), radius: 5, x: 0, y: 0)
            )
        }
        
    }
    
    
    //MARK: Education Center Button
    private var educationCenterButton: some View {
        Button {
            
        } label: {
            VStack(spacing: 0) {
                Image(Constants.educationCenterImage)
                    .resizable()
                    .frame(height: 200)
                    .cornerRadius(16)
                Text("Education Center")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .fontWeight(.medium)
            }
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .foregroundColor(.white)
                    .shadow(color: .black.opacity(0.5), radius: 5, x: 0, y: 0)
            )
        }
        
    }
    
    
    //MARK: Mall Button
    private var mallButton: some View {
        Button {
            
        } label: {
            VStack(spacing: 0) {
                Image(Constants.mallImage)
                    .resizable()
                    .frame(height: 200)
                    .cornerRadius(16)
                Text("Mall")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .fontWeight(.medium)
            }
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .foregroundColor(.white)
                    .shadow(color: .black.opacity(0.5), radius: 5, x: 0, y: 0)
            )
        }
        
    }
    
    
    //MARK: Pharmacy Button
    private var pharmacyButton: some View {
        Button {
            
        } label: {
            VStack(spacing: 0) {
                Image(Constants.pharmacyImage)
                    .resizable()
                    .frame(height: 200)
                    .cornerRadius(16)
                Text("Pharmacy")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .fontWeight(.medium)
            }
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .foregroundColor(.white)
                    .shadow(color: .black.opacity(0.5), radius: 5, x: 0, y: 0)
            )
        }
        
    }
}

/*
 Automata Theory-
 
 Rice Theorem-
 Every non tryvial property of the RE language is undecidable.
 Time 
 */
