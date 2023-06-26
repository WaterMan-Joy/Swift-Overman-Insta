//
//  EditProfileView.swift
//  OvermanInsta
//
//  Created by 김종희 on 2023/06/26.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var selectedImage: PhotosPickerItem?
    
    var body: some View {
        VStack {
            
            // toolbar
            VStack {
                HStack {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Text("취소")
                    })
                    
                    Spacer()
                    
                    Text("프로필 수정")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Button(action: {
                        print("update profile")
                    }, label: {
                        Text("완료")
                            .font(.subheadline)
                            .fontWeight(.bold)
                    })
                }
                .padding()
                
                Divider()
            }
            
            // edit profile pic
            PhotosPicker(selection: $selectedImage, label: {
                Image(systemName: "person")
            })
            
            
            // edit profile info
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
