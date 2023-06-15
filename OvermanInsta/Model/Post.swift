//
//  Post.swift
//  OvermanInsta
//
//  Created by 김종희 on 2023/06/14.
//

import Foundation


struct Post: Identifiable, Codable, Hashable {
    let id: String
    let ownerId: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Date
    var user: User?
}

extension Post {
    static var MOCK_POSTS: [Post] = [
        .init(id: NSUUID().uuidString, ownerId: NSUUID().uuidString, caption: "caption 1", likes: 12, imageUrl: "IMG_0969", timestamp: Date(), user: User.MOCK_USERS[0]),
        .init(id: NSUUID().uuidString, ownerId: NSUUID().uuidString, caption: "caption 2", likes: 31, imageUrl: "IMG_0979", timestamp: Date(),user: User.MOCK_USERS[0]),
        .init(id: NSUUID().uuidString, ownerId: NSUUID().uuidString, caption: "caption 3", likes: 9, imageUrl: "IMG_2696", timestamp: Date(),user: User.MOCK_USERS[2]),
        .init(id: NSUUID().uuidString, ownerId: NSUUID().uuidString, caption: "caption 4", likes: 9, imageUrl: "IMG_2696", timestamp: Date(),user: User.MOCK_USERS[3]),
    ]
}
