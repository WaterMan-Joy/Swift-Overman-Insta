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
    
    func createUser(userName: String, email: String, password: String)  async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
        } catch {
            print("DEBUG: failed to register user with error = \(error.localizedDescription)")
        }
    }
    
    func loadUserData() async throws { }
    
    func signout() { }
}
