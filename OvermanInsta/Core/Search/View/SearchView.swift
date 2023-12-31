//
//  SearchView.swift
//  OvermanInsta
//
//  Created by 김종희 on 2023/06/10.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchText = ""
    @StateObject var viewModel = SearchViewModel()
    
    var body: some View {
        // Search view
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(viewModel.users) { user in
                        NavigationLink(value: user) {
                            HStack {
                                CircularProfileImageView(user: user, size: .small)
                                
                                // username +
                                VStack(alignment: .leading) {
                                    Text(user.userName)
                                        .fontWeight(.semibold)
                                    if let nickName = user.nickName {
                                        Text(nickName)
                                    }
                                    Text(user.email)
                                }
                                Spacer()
                            }
                            .font(.footnote)
                            .padding(.horizontal)
                        }
                    }
                }
                .searchable(text: $searchText, prompt: "Search...")
            }
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user)
            })
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
