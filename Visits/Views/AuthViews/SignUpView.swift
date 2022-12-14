//
//  SignUpView.swift
//  Visits
//
//  Created by Adarsh Shukla on 15/08/22.
//

import SwiftUI

struct SignUpView: View {
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @StateObject private var authViewModel = AuthViewModel()
    let userType: [String] = ["User", "Advertiser"]
    @State private var selectedUserType: String = "User"
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .systemPink
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black,.font: UIFont.boldSystemFont(ofSize: 30),], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white,.font: UIFont.boldSystemFont(ofSize: 30),], for: .normal)
    }
    
    var body: some View {
        if authViewModel.signedIn {
            LocationsView()
        } else {
            signUpView
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

extension SignUpView {
    private var signUpView: some View {
        ZStack {
            Color(Constants.launchBackground)
                .ignoresSafeArea()
            
            VStack {
                VStack() {
                    signUpText
                        .padding(.horizontal)
                        .padding(.bottom, 5)
                    
                    firstNameTextField
                        .padding(.horizontal)
                    
                    lastNameTextField
                        .padding(.horizontal)
                    
                    emailField
                        .padding(.horizontal)
                    
                    passwordField
                        .padding(.horizontal)
                    
                    userTypePickerView
                        .padding()
                    
                    
                    termsAndConditionText
                        .padding(.horizontal)
                    
                    Spacer()
                    
                    VStack {
                        loginButton
                            .padding(.horizontal)
                    }
                    .padding(.top)
                }
            }
        }
    }
}

extension SignUpView {
    private var signUpText: some View {
        HStack {
            Text("Sign up")
                .foregroundColor(Color(Constants.launchAccentColor))
                .font(.title)
                .fontWeight(.bold)
            Spacer()
        }
    }
    
    private var firstNameTextField: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("First Name")
                .foregroundColor(Color(Constants.secondaryTextColor))
                .font(.body)
                .fontWeight(.semibold)
            
            TextField("Your First Name", text: $firstName)
                .padding()
                .frame(height: 45)
                .frame(maxWidth: .infinity)
                .background(Color(Constants.backgroundColor))
                .cornerRadius(8)
            
        }
    }
    
    private var lastNameTextField: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Last Name")
                .foregroundColor(Color(Constants.secondaryTextColor))
                .font(.body)
                .fontWeight(.semibold)
            
            TextField("Your Last Name", text: $lastName)
                .padding()
                .frame(height: 45)
                .frame(maxWidth: .infinity)
                .background(Color(Constants.backgroundColor))
                .cornerRadius(8)
            
        }
    }
    
    private var emailField: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("E-mail")
                .foregroundColor(Color(Constants.secondaryTextColor))
                .font(.body)
                .fontWeight(.semibold)
            
            TextField("Your Email", text: $email)
                .textInputAutocapitalization(.never)
                .padding()
                .frame(height: 45)
                .frame(maxWidth: .infinity)
                .background(Color(Constants.backgroundColor))
                .cornerRadius(8)
            
        }
    }
    
    private var passwordField: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Password")
                .foregroundColor(Color(Constants.secondaryTextColor))
                .font(.body)
                .fontWeight(.semibold)
            
            SecureField("Your Password", text: $password)
                .textInputAutocapitalization(.never)
                .padding()
                .frame(height: 45)
                .frame(maxWidth: .infinity)
                .background(Color(Constants.backgroundColor))
                .cornerRadius(8)
            
        }
    }
    
    private var termsAndConditionText: some View {
        Text("By signing up I agree to the **Terms & Condition** and **Privacy Policy***.")
            .foregroundColor(.accentColor)
            .onTapGesture {
                
            }
    }
    
    private var loginButton: some View {
        Button {
            guard !email.isEmpty, !password.isEmpty, !firstName.isEmpty,
                  !lastName.isEmpty else {
                return
            }
            authViewModel.signUp(email: email, password: password)
            UserDefaultsManager.shared.saveToUserDefaults(withKey: Constants.userType, value: selectedUserType)
        } label: {
            RoundedRectangle(cornerRadius: 8)
                .fill(.blue)
                .frame(height: 45)
                .frame(maxWidth: .infinity)
            
                .overlay(alignment: .center) {
                    Text("Agree & Sign up")
                        .foregroundColor(.white)
                        .font(.title3)
                        .fontWeight(.semibold)
                }
        }
    }
    
    private var userTypePickerView: some View {
        VStack {
            Picker("Choose the User Type", selection: $selectedUserType) {
                ForEach(userType, id: \.self) { type in
                    Text(type)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .frame(height: 45)
            
        }
    }
}
