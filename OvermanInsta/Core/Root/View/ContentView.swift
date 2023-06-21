//
//  ContentView.swift
//  OvermanInsta
//
//  Created by 김종희 on 2023/06/09.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()
    @StateObject var registerViewModel = RegisterViewModel()

    
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                LoginView()
                    .environmentObject(registerViewModel)
            }
            else if let currentUser = viewModel.currentUser{
                MainTabView(user: currentUser)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
