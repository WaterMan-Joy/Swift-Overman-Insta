//
//  ProfileEditViewModel.swift
//  OvermanInsta
//
//  Created by 김종희 on 2023/06/27.
//

import Foundation
import SwiftUI
import PhotosUI
import Firebase

@MainActor
class EditProfileViewModel: ObservableObject {
    @Published var user: User
    
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage(fromItem: selectedImage)}}
    }
    @Published var userName: String = ""
    @Published var bio: String = ""
    @Published var profileImage: Image?
    
    init(user: User) {
        self.user = user
    }
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else {return}
        guard let data = try? await item.loadTransferable(type: Data.self) else {return}
        guard let uiImage = UIImage(data: data) else {return}
        self.profileImage = Image(uiImage: uiImage)
    }
    
    func updateUserData() async throws {
        if !userName.isEmpty && user.userName != userName {
            print("DEBUG : user name")
        }
        if !bio.isEmpty && user.bio != bio {
            print("DEBUG : bio")
        }
    }
}
