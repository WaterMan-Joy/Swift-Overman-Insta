//
//  UserService.swift
//  OvermanInsta
//
//  Created by 김종희 on 2023/06/21.
//

import Foundation
import Firebase

struct UserService {
    
    static func fetchAllUsers() async throws -> [User] {
        var users: [User] = [User]()
        
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        let documents = snapshot.documents
        
        for doc in documents {
            print(doc.data())
            guard let user = try? doc.data(as: User.self) else { return users }
            users.append(user)
        }
        
        return users
    }
    
}
