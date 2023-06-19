//
//  AuthService.swift
//  OvermanInsta
//
//  Created by 김종희 on 2023/06/19.
//

import Foundation
import FirebaseAuth

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init(userSession: FirebaseAuth.User? = nil) {
        self.userSession = Auth.auth().currentUser
    }
    
    
    func login(withEmail email: String, password: String) async throws { }
    
    func createUser(email: String, password: String, userName: String)  async throws { }
    
    func loadUserData() async throws { }
    
    func signout() { }
}
