//
//  CurrentUserProfileView.swift
//  OvermanInsta
//
//  Created by 김종희 on 2023/06/14.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
    let user: User
    
    private let gridItems: Array<GridItem> = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
    ]
    
    var posts: [Post] {
        return Post.MOCK_POSTS.filter({
            $0.user?.userName == user.userName
        })
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                // header
                VStack(spacing: 10) {
                    // picture and ...
                    HStack {
                        Image("IMG_0980")
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
                        Text("Over Man")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        Text("Dev and Sports")
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
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        print("3 line click")
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.black)
                    }
                }
        }
        } // ScrollView
    }
}

struct CurrentUserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentUserProfileView(user: User.MOCK_USERS[0])
    }
}
