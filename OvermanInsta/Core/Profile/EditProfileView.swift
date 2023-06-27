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
    
    @State private var pullName: String = ""
    @State private var bio: String = ""
    
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
                .padding(.horizontal)
                Divider()
            }
            
            // edit profile pic
            PhotosPicker(selection: $selectedImage, label: {
                VStack {
                    Image(systemName: "person")
                        .resizable()
                    .frame(width: 80, height: 80)
                    Text("프로필 사진 수정하기")
                }
            })
            .padding(.vertical, 10)
            Divider()
            
            // edit profile info
            VStack {
                EditProfileRowView(title: "이름", placeholder: "이름 입력", text: $pullName)
                EditProfileRowView(title: "바이오", placeholder: "바이오 입력", text: $bio)
            }
            Spacer()
            
        }
    }
}

struct EditProfileRowView: View {
    let title: String
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        HStack {
            Text(title)
                .padding(.leading, 20)
                .frame(width: 100, alignment: .leading)
            
            VStack {
                TextField(placeholder, text: $text)
                Divider()
            }
        }
        .font(.subheadline)
        .frame(height: 36)
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
