//
//  LoginView.swift
//  OvermanInsta
//
//  Created by 김종희 on 2023/06/10.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        // Login View
        NavigationStack {
            VStack {
                
                Image("over_man_logo")
                    .resizable()
                    .scaledToFill()
                    
                
                // text fields
                VStack {
                    // email
                    TextField("email", text: $viewModel.email)
                        .autocapitalization(.none)
                        .modifier(IGTextFieldModifier())
                    
                    // password
                    SecureField("password", text: $viewModel.password)
                        .modifier(IGTextFieldModifier())
                }
                
                // forgot button
                Button {
                    print("forgot password")
                } label: {
                    Text("Forgot Password")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                // login button
                Button {
                    print("login click")
                    Task {try await viewModel.signIn()}
                } label: {
                    Text("Login")
                        .modifier(BlueButtonModifier())
                }
                
                // google + facebook login
                HStack {
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
                    Text("OR")
                Rectangle()
                    .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
                }
                
                HStack {
                    // facebook logo
                    Image("facebook.svg")
                        .resizable()
                        .scaledToFit().frame(width: 40, height: 40)
                    Text("Facebook Login")
                }
                
                Spacer()
                
                Divider()
                
                NavigationLink {
                    AddEmailView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    Text("Don't have an account? Sing Up")
                }
                .padding(.vertical)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
