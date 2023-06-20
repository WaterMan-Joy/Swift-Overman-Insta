//
//  AddPasswordView.swift
//  OvermanInsta
//
//  Created by 김종희 on 2023/06/13.
//

import SwiftUI

struct CreatePasswordView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegisterViewModel
    
    var body: some View {
        VStack {
            Text("ADD YOUR PASSWORD")
                .font(.footnote)
                .fontWeight(.semibold)
                .padding(.vertical)
            
            
            
            TextField("Password", text: $viewModel.password)
                .autocapitalization(.none)
                .modifier(IGTextFieldModifier())
            
            NavigationLink {
                CompleteSignUpView()
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

struct CreatePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePasswordView()
    }
}
