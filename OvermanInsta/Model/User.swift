//
//  User.swift
//  OvermanInsta
//
//  Created by 김종희 on 2023/06/13.
//

import Foundation

struct User: Identifiable, Codable, Hashable {
    let id: String
    let email: String
    var userName: String
    var nickName: String?
    var profileImageUrl: String?
    var bio: String?
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, email: "111@111.com", userName: "user name 1", nickName: "nick name 1", profileImageUrl: "IMG_0979", bio: "bio 1"),
        .init(id: NSUUID().uuidString, email: "222@222.com", userName: "user name 2", nickName: "nick name 2", profileImageUrl: "IMG_0979", bio: "bio 2"),
        .init(id: NSUUID().uuidString, email: "333@333.com", userName: "user name 3", nickName: "nick name 3", profileImageUrl: "IMG_0979", bio: "bio 3"),
        .init(id: NSUUID().uuidString, email: "444@444.com", userName: "user name 4", nickName: "nick name 4")
    ]
}
