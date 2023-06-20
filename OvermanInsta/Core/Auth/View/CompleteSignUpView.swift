//
//  CompleteSignUpView.swift
//  OvermanInsta
//
//  Created by 김종희 on 2023/06/13.
//

import SwiftUI

struct CompleteSignUpView: View {
    
    @EnvironmentObject var viewModel: RegisterViewModel
    
    var body: some View {
        VStack {
            Text("Welcome to overman insta,  \(viewModel.userName)")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.vertical)
                .multilineTextAlignment(.center)
            
            Button {
                print("complete sign in")
                Task { try await viewModel.createUser() }
            } label: {
                Text("Complete Sign Up")
                   .modifier(BlueButtonModifier())
            }
        }
    }
}

struct CompleteSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteSignUpView()
    }
}
