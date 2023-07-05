//
//  ProfileView.swift
//  OvermanInsta
//
//  Created by 김종희 on 2023/06/09.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User

    var body: some View {
        // ProfileView
        ScrollView {
            // header
            ProfileHeaderView(user: user)
            
            // post grid view
            PostGridView(user: user)
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User.MOCK_USERS[0])
    }
}
