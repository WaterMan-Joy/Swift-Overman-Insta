//
//  RegisterViewModel.swift
//  OvermanInsta
//
//  Created by 김종희 on 2023/06/20.
//

import Foundation

class RegisterViewModel: ObservableObject {
    @Published var userName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    
    func createUser() async throws{
       try await AuthService.shared.createUser(userName: userName, email: email, password: password)
        
        userName = ""
        email = ""
        password = ""
    }
    
}
