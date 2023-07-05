//
//  FeedCell.swift
//  OvermanInsta
//
//  Created by 김종희 on 2023/06/09.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {
    
    let post: Post
    
    var body: some View {
        VStack {
            // image + name
            HStack {
                if let user = post.user {
                    CircularProfileImageView(user: user, size: .xSmall)
                    
                }
                Text(post.user?.userName ?? "")
                    .font(.footnote)
                    .fontWeight(.semibold)
                Spacer()
                    
            }
            .padding(.leading)
            
            // post image
            KFImage(URL(string: post.imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 400, height: 400)
                .clipShape(Rectangle())
            
            // action buttons (like, caption, message)
            HStack(spacing: 16) {
                Button {
                    print(post.likes)
                } label: {
                    Image(systemName: "heart")
                    .imageScale(.large)
                }
                Button {
                    print("comment on post")
                } label: {
                    Image(systemName: "text.bubble")
                        .imageScale(.large)
                }
                Button {
                    print("share post")
                } label: {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }
                Spacer()
            }
            .padding(.leading)
            .padding(.top, 5)
            .foregroundColor(.black)
            
            // like
            Text("\(post.likes) likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
                .padding(.top, 1)
            
            // caption label
            HStack {
                Text(post.user?.userName ?? "")
                    .fontWeight(.bold) +
                Text(" \(post.caption)")
            }
            .font(.footnote)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 20)
            .padding(.top, 1)
            
            // time
            Text("\(post.timestamp)")
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
                .padding(.top, 1)
                .foregroundColor(.gray)
            Divider()
        }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell(post: Post.MOCK_POSTS[0])
    }
}
