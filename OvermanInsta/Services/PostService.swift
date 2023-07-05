//
//  PostService.swift
//  OvermanInsta
//
//  Created by 김종희 on 2023/07/04.
//


import Firebase

struct PostService {
    
    private static let postsCollection = Firestore.firestore().collection("posts")
    
    static func fetchFeedPosts() async throws -> [Post]{
        
        let snapshot = try await postsCollection.getDocuments()
        var posts = try snapshot.documents.compactMap({try $0.data(as: Post.self)})
        
        for i in 0 ..< posts.count {
            let post = posts[i]
            let ownerUid = post.ownerId
            let postUser = try await UserService.fetchUser(withUid: ownerUid)
            posts[i].user = postUser
        }
        return posts
    }
    
    static func fetchUserPosts(uid: String) async throws -> [Post]{
        let snapshot = try await postsCollection.whereField("ownerId", isEqualTo: uid).getDocuments()
        
        return try snapshot.documents.compactMap({try $0.data(as: Post.self)})
    }
}
