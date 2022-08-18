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
    @StateObject private var authViewModel = AuthViewModel()
    
    var body: some View {
        if authViewModel.signedIn {
            LocationsView()
        } else {
            loginView
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

extension LoginView {
    private var loginView: some View {
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
                //backButton
                Spacer()
                customDivider
                signUpSegue
            }
        }
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
                SignUpView()
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
            .textInputAutocapitalization(.never)
            .frame(height: 50)
            .scenePadding(.horizontal)
            .background(Color(Constants.backgroundColor))
            .cornerRadius(8)
            .focused($focusedField, equals: .username)
    }
    
    private var passwordField: some View {
        SecureField("Password", text: $passwordText)
            .textInputAutocapitalization(.never)
            .frame(height: 50)
            .scenePadding(.horizontal)
            .background(Color(Constants.backgroundColor))
            .cornerRadius(8)
            .focused($focusedField, equals: .password)
    }
    
    private var loginButton: some View {
        Button {
            guard !emailText.isEmpty, !passwordText.isEmpty else {
                return
            }
            authViewModel.signIn(email: emailText, password: passwordText)
        } label: {
            RoundedRectangle(cornerRadius: 8)
                .fill(.blue)
                .frame(height: 50)
                .frame(maxWidth: .infinity)
            
                .overlay(alignment: .center) {
                    Text("Log In")
                        .foregroundColor(.white)
                        .font(.title3)
                        .fontWeight(.semibold)
                }
        }
    }
    
    private var customDivider: some View {
        RoundedRectangle(cornerRadius: 8)
            .foregroundColor(Color(Constants.secondaryTextColor).opacity(0.6))
            .frame(height: 1)
            .padding()
    }
}
