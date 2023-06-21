//
//  AuthService.swift
//  OvermanInsta
//
//  Created by 김종희 on 2023/06/19.
//

import Foundation
import FirebaseAuth
import FirebaseFirestoreSwift
import Firebase

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init(userSession: FirebaseAuth.User? = nil) {
        self.userSession = Auth.auth().currentUser
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
        } catch {
            print("DEBUG: failed to sign in with error = \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(userName: String, email: String, password: String)  async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            print("DEBUG: did create user...")
            await uploadUserData(uid: result.user.uid, userName: userName, email: email)
            print("DEBUG: did upload user data...")
        } catch {
            print("DEBUG: failed to register user with error = \(error.localizedDescription)")
        }
    }
    
    func loadUserData() async throws { }
    
    func signout() {
        try? Auth.auth().signOut()
        self.userSession = nil
    }
    
    private func uploadUserData(uid: String, userName: String, email: String) async {
        let user = User(id: uid, email: email, userName: userName)
        guard let encodedUser = try? Firestore.Encoder().encode(user) else {return}
        try? await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
    }
}
