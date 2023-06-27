//
//  ProfileHeaderView.swift
//  OvermanInsta
//
//  Created by 김종희 on 2023/06/15.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    let user: User
    @State private var showEditProfile: Bool = false
    
    var body: some View {
        VStack(spacing: 10) {
            // picture and ...
            HStack {
                Image(user.profileImageUrl ?? "")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                
                Spacer()
                
                HStack(spacing: 8) {
                    UserStatView(value: 12, title: "Posts")
                    UserStatView(value: 140, title: "Followers")
                    UserStatView(value: 203, title: "Following")
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 4)
            
            // name and ...
            VStack(alignment: .leading, spacing: 4) {
                Text(user.userName)
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Text(user.nickName ?? "no nick name")
                    .font(.footnote)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            // action button
            Button() {
                if user.isCurrentUser {
                    print("edit profile")
                    showEditProfile.toggle()
                }
                else {
                    print("follow user")
                }
            } label: {
                Text(user.isCurrentUser ? "Edit Profile" : "Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .background(user.isCurrentUser ? .white : .blue)
                    .cornerRadius(6)
                    .foregroundColor(user.isCurrentUser ? .black : .white)
                    .overlay(RoundedRectangle(cornerRadius: 6).stroke(user.isCurrentUser ? .gray : .clear, lineWidth: 1))
                
            }
            
            Divider()
            
        }
        .fullScreenCover(isPresented: $showEditProfile, content: {
                EditProfileView()
        })
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(user: User.MOCK_USERS[0])
    }
}
