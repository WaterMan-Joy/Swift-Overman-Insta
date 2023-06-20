//
//  ContentViewModel.swift
//  OvermanInsta
//
//  Created by 김종희 on 2023/06/19.
//

import Foundation
import Firebase
import Combine

@MainActor
class ContentViewModel: ObservableObject {
    
    private let service = AuthService.shared
    private var calcellables = Set<AnyCancellable>()
    
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        setupSubscribers()
    }
    
    func setupSubscribers() {
        service.$userSession.sink{ [weak self] userSession in
            self?.userSession = userSession
        }
        .store(in: &calcellables)
    }
}
