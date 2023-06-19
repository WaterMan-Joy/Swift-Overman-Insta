//
//  CompleteSignUpView.swift
//  OvermanInsta
//
//  Created by 김종희 on 2023/06/13.
//

import SwiftUI

struct CompleteSignUpView: View {
    var body: some View {
        VStack {
            Text("Welcome to Overman Insta Welcome to Overman Insta Welcome to Overman Insta")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.vertical)
                .multilineTextAlignment(.center)
            
            Button {
                print("complete sign in")
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
