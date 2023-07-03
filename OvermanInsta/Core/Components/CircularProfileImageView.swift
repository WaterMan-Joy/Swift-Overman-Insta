//
//  CircularProfileImageView.swift
//  OvermanInsta
//
//  Created by 김종희 on 2023/07/03.
//

import SwiftUI
import Kingfisher

struct CircularProfileImageView: View {
    
    let user: User
    
    
    var body: some View {
        if let imageUrl = user.profileImageUrl {
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .clipShape(Circle())
        }
        else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
        }
    }
}

struct CircularProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProfileImageView(user: User.MOCK_USERS[0])
    }
}
