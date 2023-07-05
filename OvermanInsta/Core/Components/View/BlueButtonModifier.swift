//
//  BlueButtonModifier.swift
//  OvermanInsta
//
//  Created by 김종희 on 2023/06/13.
//

import SwiftUI

struct BlueButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .cornerRadius(10)
            .padding()
    }
}
