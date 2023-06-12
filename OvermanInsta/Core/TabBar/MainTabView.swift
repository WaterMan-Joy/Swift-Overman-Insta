//
//  MainTabView.swift
//  OvermanInsta
//
//  Created by 김종희 on 2023/06/09.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            FeedView()
                .tabItem() {
                    Image(systemName: "house")
                }
            SearchView()
                .tabItem() {
                    Image(systemName: "magnifyingglass")
                }
            Text("Upload Post")
                .tabItem() {
                    Image(systemName: "plus")
                }
            Text("Notifications")
                .tabItem() {
                    Image(systemName: "heart")
                }
            ProfileView()
                .tabItem() {
                    Image(systemName: "person")
                }
        }
        .accentColor(.black)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
