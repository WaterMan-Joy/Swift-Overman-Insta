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
    @Published var currentUser: User?
    
    static let shared = AuthService()
    
    init(userSession: FirebaseAuth.User? = nil) {
        Task { try await loadUserData()}
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await loadUserData()
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
    
    @MainActor
    func loadUserData() async throws {
        self.userSession = Auth.auth().currentUser
//        guard let currentUid = Auth.auth().currentUser?.uid else {return}
        guard let currentUid = userSession?.uid else {return}
        let snapshot =  try await Firestore.firestore().collection("users").document(currentUid).getDocument()
        print("Snapshot data is \(String(describing: snapshot.data()))")
        self.currentUser = try? snapshot.data(as: User.self)
    }
    
    func signout() {
        try? Auth.auth().signOut()
        self.userSession = nil
        self.currentUser = nil
    }
    
    private func uploadUserData(uid: String, userName: String, email: String) async {
        let user = User(id: uid, email: email, userName: userName)
        self.currentUser = user
        guard let encodedUser = try? Firestore.Encoder().encode(user) else {return}
        try? await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
    }
}
