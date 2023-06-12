//
//  SearchView.swift
//  OvermanInsta
//
//  Created by 김종희 on 2023/06/10.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchText = ""
    
    var body: some View {
        // Search view
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(0 ... 15, id: \.self) { user in
                        
                        // user profile
                        HStack {
                            Image("IMG_0980")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40, height: 40)
                                .clipShape(Circle())
                            
                            // username +
                            VStack(alignment: .leading) {
                                Text("Over Man")
                                    .fontWeight(.semibold)
                                Text("sumkim93@gmail.com")
                            }
                            Spacer()
                        }
                        .font(.footnote)
                        .padding(.horizontal)
                    }
                }
                .searchable(text: $searchText, prompt: "Search...")
            }
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
