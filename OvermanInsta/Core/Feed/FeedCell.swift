//
//  FeedCell.swift
//  OvermanInsta
//
//  Created by 김종희 on 2023/06/09.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        VStack {
            // image + name
            HStack {
                Image("IMG_0980")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                
                Text("Over Man")
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Spacer()
                    
            }
            .padding(.leading)
            
            // post image
            Image("IMG_0967")
                .resizable()
                .scaledToFit()
                .frame(width: 400, height: 400)
                .clipShape(Rectangle())
            
            // action buttons (like, caption, message)
            HStack(spacing: 16) {
                Button {
                    print("like post")
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
            Text("23 likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
                .padding(.top, 1)
            
            // caption label
            HStack {
                Text("Over Man ")
                    .fontWeight(.semibold) +
                Text("caption for now caption for now caption for now caption for now")
            }
            .font(.footnote)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 20)
            .padding(.top, 1)
            
            // time
            Text("6h ago")
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
        FeedCell()
    }
}
