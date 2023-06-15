//
//  UploadPostView.swift
//  OvermanInsta
//
//  Created by 김종희 on 2023/06/15.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    
    @State private var caption: String = ""
    @State private var imagePickerPresented: Bool = false
    @StateObject var viewModel = UploadPostViewModel()
    @Binding var tabIndex: Int
    
    var body: some View {
        VStack() {
            
            // cancel and upload view
            HStack {
                Button(action: {
                    print("cancel button click")
                    caption = ""
                    viewModel.selectedImage = nil
                    viewModel.postImage = nil
                    tabIndex = 0
                }, label: {
                    Text("Cancel")
                })
                Spacer()
                Text("New Post")
                    .font(.headline)
                Spacer()
                Button(action: {
                    print("upload button click")
                }, label: {
                    Text("Upload")
                })
            }
            .padding(.horizontal)
            
            
            HStack(spacing: 10) {
                if let image = viewModel.postImage {
                        image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .cornerRadius(10)
                }
                
                TextField("Enter your caption...", text: $caption, axis: .vertical)
                
            }
            .padding()
            
            Spacer()
        }
        .onAppear() {
            imagePickerPresented.toggle()
        }
        .photosPicker(isPresented: $imagePickerPresented, selection: $viewModel.selectedImage)
    }
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView(tabIndex: .constant(0))
    }
}
