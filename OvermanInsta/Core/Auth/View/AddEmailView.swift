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
    @EnvironmentObject var viewModel: RegisterViewModel
    
    var body: some View {
        VStack {
            Text("ADD YOUR EMAILL")
                .font(.footnote)
                .fontWeight(.semibold)
                .padding(.vertical)
            
            
            
            TextField("Email", text: $viewModel.email)
                .autocapitalization(.none)
                .modifier(IGTextFieldModifier())
            
            NavigationLink {
                CreateUsernameView()
                    .navigationBarBackButtonHidden(true)
            } label: {
                Text("Next")
                    .modifier(BlueButtonModifier())

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
