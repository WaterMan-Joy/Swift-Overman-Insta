//
//  AddUsernameView.swift
//  OvermanInsta
//
//  Created by 김종희 on 2023/06/12.
//

import SwiftUI

struct CreateUsernameView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegisterViewModel
    
    var body: some View {
        VStack {
            Text("ADD YOUR USER NAME")
                .font(.footnote)
                .fontWeight(.semibold)
                .padding(.vertical)
            
            
            
            TextField("User Name", text: $viewModel.userName)
                .autocapitalization(.none)
                .modifier(IGTextFieldModifier())
            
            NavigationLink {
                CreatePasswordView()
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

struct CreateUsernameView_Previews: PreviewProvider {
    static var previews: some View {
        CreateUsernameView()
    }
}
