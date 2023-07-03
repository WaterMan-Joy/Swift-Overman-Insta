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
    
    @StateObject var viewModel: EditProfileViewModel
    
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: EditProfileViewModel(user: user))
    }
    
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
                        Task {
                            try await viewModel.updateUserData()
                            dismiss()
                        }
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
            PhotosPicker(selection: $viewModel.selectedImage, label: {
                VStack {
                    if let image = viewModel.profileImage {
                        image
                            .resizable()
                            .frame(width: 80, height: 80)
                            .cornerRadius(10)
                    }
                    else {
                        CircularProfileImageView(user: viewModel.user, size: .large)
                    }
                    Text("프로필 사진 수정하기")
                }
            })
            .padding(.vertical, 10)
            Divider()
            
            // edit profile info
            VStack {
                EditProfileRowView(title: "이름", placeholder: "이름 입력", text: $viewModel.userName)
                EditProfileRowView(title: "바이오", placeholder: "바이오 입력", text: $viewModel.bio)
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
        EditProfileView(user: User.MOCK_USERS[0])
    }
}
