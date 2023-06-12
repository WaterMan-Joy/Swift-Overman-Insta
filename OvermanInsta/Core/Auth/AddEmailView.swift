//
//  AddEmailView.swift
//  OvermanInsta
//
//  Created by 김종희 on 2023/06/12.
//

import SwiftUI

struct AddEmailView: View {

    @State private var email: String = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text("ADD YOUR EMAILL")
                .font(.footnote)
                .fontWeight(.semibold)
            
            TextField("Email", text: $email)
                .autocapitalization(.none)
                .modifier(IGTextFieldModifier())
            
            Button {
                print("login click")
            } label: {
                Text("Login")
                    .padding(10)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding()
            }
            .padding(.vertical)
            
            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
    }
}

struct AddEmailView_Previews: PreviewProvider {
    static var previews: some View {
        AddEmailView()
    }
}
