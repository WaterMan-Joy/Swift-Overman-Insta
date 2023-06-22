//
//  SearchViewModel.swift
//  OvermanInsta
//
//  Created by 김종희 on 2023/06/22.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var users: [User] = [User]()
    
    init() {
        Task { try await fetchAllUsers() }
    }
    
    @MainActor
    func fetchAllUsers() async throws {
        self.users = try await UserService.fetchAllUsers()
    }
}
