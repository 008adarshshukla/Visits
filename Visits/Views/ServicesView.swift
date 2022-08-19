//
//  ServicesView.swift
//  Visits
//
//  Created by Adarsh Shukla on 19/08/22.
//

import SwiftUI

struct ServicesView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 0) {
                    Image(Constants.hospitalImage)
                        .resizable()
                        .frame(height: 300)
                        .cornerRadius(16)
                    Text("Hospital")
                        .font(.largeTitle)
                        .fontWeight(.medium)
                }
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundColor(.white)
                        .shadow(color: .black.opacity(0.5), radius: 5, x: 0, y: 0)
                )
                .padding()
            }
            .navigationTitle(Text("Explore Services"))
        }
    }
}

struct ServicesView_Previews: PreviewProvider {
    static var previews: some View {
        ServicesView()
    }
}


