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
    var body: some View {
        ZStack {
            Color(Constants.backgroundColor)
                .ignoresSafeArea()
            
            VStack {
                headerView
                    .padding(.horizontal,4)
                
               Spacer()
            }
            
            VStack {
                Text("Oops!!! No Businesses added yet.")
                Text("Please add Businesses!!!")
            }
            .font(.subheadline)
        }
    }
}

struct AdvertiserHomeView_Previews: PreviewProvider {
    static var previews: some View {
        AdvertiserHomeView()
    }
}

extension AdvertiserHomeView {
    private var headerView: some View {
        HStack {
            Circle()
                .foregroundColor(.white)
                .frame(width: 50, height: 50)
                .shadow(color: .black.opacity(0.25), radius: 10, x: 0, y: 0)
                .overlay(alignment: .center) {
                    Image(systemName: "person.fill")
                        .font(.headline)
                }
                .padding()
                .background(
                    Circle()
                        .stroke(lineWidth: 4)
                        .foregroundColor(.black.opacity(0.5))
                        .scaleEffect(showProfileButtonAnimation ? 1 : 0)
                        .opacity(showProfileButtonAnimation ? 0 : 1)
                )
                .onTapGesture {
                    //add the code for tap gesture
                    withAnimation(Animation.easeInOut(duration: 0.8)) {
                        showProfileButtonAnimation.toggle()
                    }
                }
            Spacer()
            Text("Portfolio")
                .font(.title)
                .fontWeight(.heavy)
            Spacer()
            
            Circle()
                .foregroundColor(.white)
                .frame(width: 50, height: 50)
                .shadow(color: .black.opacity(0.25), radius: 10, x: 0, y: 0)
                .overlay(alignment: .center) {
                    Image(systemName: "plus")
                        .font(.headline)
                }
                .padding()
                .background(
                    Circle()
                        .stroke(lineWidth: 4)
                        .foregroundColor(.black.opacity(0.5))
                        .scaleEffect(showNewButtonAnimation ? 1 : 0)
                        .opacity(showNewButtonAnimation ? 0 : 1)
                )
                .onTapGesture {
                    //add the code for tap gesture
                    withAnimation(Animation.easeInOut(duration: 0.8)) {
                        showNewButtonAnimation.toggle()
                    }
                }
        }
    }
}
