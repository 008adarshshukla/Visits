//
//  AdvertiserAndUserView.swift
//  Visits
//
//  Created by Adarsh Shukla on 18/08/22.
//

import SwiftUI

struct AdvertiserAndUserView: View {
    var body: some View {
        VStack {
            Button {
                
            } label: {
                Image(Constants.travllerImage)
                    .resizable()
                    .frame(height: 300)
                    .cornerRadius(10)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 300)
                            .shadow(color: .black.opacity(0.3), radius: 3, x: 0, y: 0)
                    )
                    .padding()
            }
            
            Button {
                
            } label: {
                Image(Constants.AdvertiserImage)
                    .resizable()
                    .frame(height: 300)
                    .cornerRadius(10)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 300)
                            .shadow(color: .black.opacity(0.3), radius: 3, x: 0, y: 0)
                    )
                    .padding()
            }
            
        }
    }
}

struct AdvertiserAndUserView_Previews: PreviewProvider {
    static var previews: some View {
        AdvertiserAndUserView()
    }
}
