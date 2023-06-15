//
//  ProfileView.swift
//  OvermanInsta
//
//  Created by 김종희 on 2023/06/09.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User
    
    var posts: [Post] {
        return Post.MOCK_POSTS.filter({ $0.user?.userName == user.userName})
    }
    
    private let gridItems: Array<GridItem> = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
    ]
    var body: some View {
        // ProfileView
        ScrollView {
            // header
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
                    
                } label: {
                    Text("Profile Edit")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 360, height: 32)
                        .foregroundColor(.black)
                        .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color.gray, lineWidth: 1))
                }
                
                Divider()
            }
            
            // post grid view
            PostGridView(posts: posts)
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User.MOCK_USERS[0])
    }
}
