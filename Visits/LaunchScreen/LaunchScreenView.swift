//
//  LaunchScreenView.swift
//  Visits
//
//  Created by Adarsh Shukla on 03/08/22.
//

import SwiftUI

struct LaunchScreenView: View {
    
    let timer = Timer.publish(every: 0.3, on: .main, in: .common)
        .autoconnect()
    @State private var count = 0
    
    var body: some View {
        ZStack {
            Color("LaunchBackgroundColor")
                .ignoresSafeArea()
            
            VStack {
                Image("LogoImage")
                    .resizable()
                    .frame(width: 120, height: 120, alignment: .center)
                
                loadingView
                    .padding(.top, 20)
            }
        }
        .onReceive(timer) { _ in
            withAnimation(Animation.easeInOut(duration: 0.3)) {
                count = count == 4 ? 0 : count + 1
            }
        }
    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
    }
}

extension LaunchScreenView {
    private var loadingView: some View {
        HStack {
            Circle()
                .fill(
                    LinearGradient(colors: [Color.green, Color.blue], startPoint: .leading, endPoint: .trailing)
                )
                .frame(width: 10, height: 10)
                .offset(y: count == 1 ? -5 : 0)
            
            Circle()
                .fill(
                    LinearGradient(colors: [Color.green, Color.blue], startPoint: .leading, endPoint: .trailing)
                )
                .frame(width: 10, height: 10)
                .offset(y: count == 2 ? -5 : 0)
            Circle()
                .fill(
                    LinearGradient(colors: [Color.green, Color.blue], startPoint: .leading, endPoint: .trailing)
                )
                .frame(width: 10, height: 10)
                .offset(y: count == 3 ? -5 : 0)
            
            Circle()
                .fill(
                    LinearGradient(colors: [Color.green, Color.blue], startPoint: .leading, endPoint: .trailing)
                )
                .frame(width: 10, height: 10)
                .offset(y: count == 4    ? -5 : 0)
        }
    }
}
