//
//  ChooseImage.swift
//  Hackathon 23
//
//  Created by kai on 11/30/23.
//


import SwiftUI
import PhotosUI
 
struct ChooseImage: View {
 
    @State private var selectedItem: PhotosPickerItem?
 
    var body: some View {
        PhotosPicker(selection: $selectedItem,
                     matching: .images) {
            Label("Upload a photo", systemImage: "photo")
        }
    }
}

#Preview {
    ChooseImage()
}
