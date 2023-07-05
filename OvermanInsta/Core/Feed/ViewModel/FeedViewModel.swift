//
//  FeedViewModel.swift
//  OvermanInsta
//
//  Created by 김종희 on 2023/07/03.
//

import Foundation
import Firebase
import SwiftUI

class FeedViewModel: ObservableObject {
    
    @Published var posts: [Post] = [Post]()
    
    init() {
        Task {
            try await fetchPosts()
        }
    }
    
    @MainActor
    func fetchPosts() async throws {
        self.posts = try await PostService.fetchFeedPosts()
    }
}
