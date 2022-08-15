//
//  LoginView.swift
//  Visits
//
//  Created by Adarsh Shukla on 15/08/22.
//

import SwiftUI

struct LoginView: View {
    
    enum FocusedField {
        case username, password
    }
    
    @State private var emailText: String = ""
    @State private var passwordText: String = ""
    @FocusState private var focusedField: FocusedField?
    
    var body: some View {
        ZStack {
            Color(Constants.launchBackground)
                .ignoresSafeArea()
            
            VStack {
                appName
                
                VStack(spacing: 16) {
                    textField
                    passwordField
                    loginButton
                }
                .onSubmit {
                    if focusedField == .username {
                        focusedField = .password
                    } else {
                        focusedField = nil
                    }
                    
                }
            }
            .padding(.horizontal, 6)
            
            VStack {
                Spacer()
                signUpSegue
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

extension LoginView {
    
    private var appName: some View {
        Text("Visits")
            .foregroundColor(Color("LaunchAccentColor"))
            .font(.custom("Satisfy Regular", size: 60, relativeTo: .largeTitle))
    }
    
    
    private var signUpSegue: some View {
        HStack {
            Spacer()
            Text("Dont't have an account?")
                .foregroundColor(Color(Constants.secondaryTextColor))
            NavigationLink {
                
            } label: {
                Text("Sign up.")
                    .foregroundColor(.white)
                    .bold()
            }
            
            Spacer()
        }
    }
    
    private var textField: some View {
        TextField("Email Address...", text: $emailText)
            .frame(height: 55)
            .scenePadding(.horizontal)
            .background(Color(Constants.backgroundColor))
            .cornerRadius(8)
            .focused($focusedField, equals: .username)
    }
    
    private var passwordField: some View {
        SecureField("Password", text: $passwordText)
            .frame(height: 55)
            .scenePadding(.horizontal)
            .background(Color(Constants.backgroundColor))
            .cornerRadius(8)
            .focused($focusedField, equals: .password)
    }
    
    private var loginButton: some View {
        Button {
            
        } label: {
            RoundedRectangle(cornerRadius: 8)
                .fill(.blue)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
            
                .overlay(alignment: .center) {
                    Text("Log In")
                        .foregroundColor(.white)
                        .font(.title3)
                        .fontWeight(.semibold)
                }
        }
    }
}
