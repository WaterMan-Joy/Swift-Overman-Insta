//
//  LoginViewModel.swift
//  OvermanInsta
//
//  Created by 김종희 on 2023/06/21.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    func signIn() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
