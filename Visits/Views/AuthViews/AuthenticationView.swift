//
//  AuthenticationView.swift
//  Visits
//
//  Created by Adarsh Shukla on 14/08/22.
//

import SwiftUI

struct AuthenticationView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color("LaunchBackgroundColor")
                    .ignoresSafeArea()
                
                VStack {
                    appName
                    
                    loginAndSignUpButtons
                        .padding(.top, 100)
                }
            }
            .navigationBarHidden(true)
        }
        .accentColor(Color(Constants.secondaryTextColor))
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
    }
}






 

extension AuthenticationView {
    private var appName: some View {
        Text("Visits")
            .foregroundColor(Color("LaunchAccentColor"))
            .font(.custom("Satisfy Regular", size: 60, relativeTo: .largeTitle))
    }
    
    private var loginAndSignUpButtons: some View {
        VStack {
            
            NavigationLink {
                LoginView()
            } label: {
                RoundedRectangle(cornerRadius: 8)
                    .fill(.blue)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 8)
                    .overlay(alignment: .center) {
                        Text("Log In")
                            .foregroundColor(.white)
                            .font(.title3)
                            .fontWeight(.semibold)
                    }
            }
            HStack {
                RoundedRectangle(cornerRadius: 2)
                    .frame(height: 2)
                    .foregroundColor(.gray)
                Text("OR")
                    .foregroundColor(Color("SecondaryTextColor"))
                RoundedRectangle(cornerRadius: 2)
                    .frame(height: 2)
                    .foregroundColor(.gray)
            }
            .padding()
            .padding(.bottom)
            
            NavigationLink {
                
            } label: {
                RoundedRectangle(cornerRadius: 8)
                    .fill(.blue)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 8)
                    .overlay(alignment: .center) {
                        Text("Sign Up With Email Address")
                            .foregroundColor(.white)
                            .font(.title3)
                            .fontWeight(.semibold)
                    }
            }
            .padding(.top)
            
        }
    }
}
