//
//  PostGridView.swift
//  OvermanInsta
//
//  Created by 김종희 on 2023/06/15.
//

import SwiftUI

struct PostGridView: View {
    
    var posts: [Post]
    
    private let imageDimension: CGFloat = (UIScreen.main.bounds.width / 3) - 1
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
    ]
    
    var body: some View {
        LazyVGrid(columns: gridItems, spacing: 1) {
            ForEach(posts){ post in
                Image(post.imageUrl)
                    .resizable()
                    .scaledToFill()
                    .frame(width: imageDimension, height: imageDimension)
                    .clipped()
                
            }
        }
    }
}

struct PostGridView_Previews: PreviewProvider {
    static var previews: some View {
        PostGridView(posts: Post.MOCK_POSTS)
    }
}
