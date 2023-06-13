//
//  IGTextFieldModifier.swift
//  OvermanInsta
//
//  Created by 김종희 on 2023/06/12.
//

import SwiftUI

struct IGTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.footnote)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal, 20)
            
    }
}
