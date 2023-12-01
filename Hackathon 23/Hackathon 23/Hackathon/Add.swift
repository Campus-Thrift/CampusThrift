//
//  Add.swift
//  Hackathon 23
//
//  Created by kai on 11/28/23.
//

import SwiftUI
import PhotosUI

struct Add: View {
    
    @State private var selectedPhotoData: Data?
    @State private var selectedItem: PhotosPickerItem?
    @State private var phoneNumber: String = ""
    
    var body: some View {
        VStack() {
            HStack(spacing: 270) {
                //cornell logo
                Image("cornell")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 34.10, height: 33)
                //                    .padding([.top, .leading, .trailing])
                
                //shopping cart
                Image("shopping-cart")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 30, height: 30)
                //                    .padding([.top, .trailing])
            }
            Text("Campus Thrift")
                .font(Font.custom("Rubik-Light", size: 32).weight(.light))
                .foregroundColor(.black)
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 348, height: 291)
                .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                .cornerRadius(5)
                .overlay(PhotosPicker(selection: $selectedItem,
                         matching: .images) {
                Label("Upload a photo", systemImage: "photo")
                        .font(Font.custom("Rubik-Light", size: 25).weight(.light))
                        .foregroundColor(.black)
                        .frame(width: 348, height: 291)
                        .selectionDisabled(true)
                        .onChange(of: selectedItem) { newItem in
                            Task {
                                if let data = try? await newItem?.loadTransferable(type: Data.self) {
                                    selectedPhotoData = data
                                }
                            }
                        }
                if let selectedPhotoData,
                    let image = UIImage(data: selectedPhotoData) {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 291)
                        .offset(x: -178)
                    }
                })
            Spacer()
            VStack (spacing: 10) {
                Text("Enter Title")
                    .font(Font.custom("Rubik", size: 32).weight(.light))
                    .foregroundColor(Color(red: 0.16, green: 0.18, blue: 0.20))
                Rectangle().fill(Color.gray).frame(width: .infinity, height: 0.50, alignment: .center)
                HStack (spacing: 213) {
                    Text("Size")
                        .font(Font.custom("Rubik", size: 24).weight(.light))
                        .foregroundColor(Color(red: 0.35, green: 0.36, blue: 0.37))
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 92, height: 35)
                        .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                        .cornerRadius(5)
                }
                Rectangle().fill(Color.gray).frame(width: .infinity, height: 0.50, alignment: .center)
                HStack (spacing: 160) {
                    Text("Condition")
                        .font(Font.custom("Rubik", size: 24).weight(.light))
                        .foregroundColor(Color(red: 0.35, green: 0.36, blue: 0.37))
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 92, height: 35)
                        .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                        .cornerRadius(5)
                }
                Rectangle().fill(Color.gray).frame(width: .infinity, height: 0.50, alignment: .center)
                HStack (spacing: 205) {
                    Text("Price")
                        .font(Font.custom("Rubik", size: 24).weight(.light))
                        .foregroundColor(Color(red: 0.35, green: 0.36, blue: 0.37))
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 92, height: 35)
                        .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                        .cornerRadius(5)
                }
                Rectangle().fill(Color.gray).frame(width: .infinity, height: 0.50, alignment: .center)
                HStack (spacing: 90) {
                    Text("Pickup Location")
                        .font(Font.custom("Rubik", size: 24).weight(.light))
                        .foregroundColor(Color(red: 0.35, green: 0.36, blue: 0.37))
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 92, height: 35)
                        .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                        .cornerRadius(5)
                }
            }
//            Spacer()
//            Spacer()
            Rectangle()
                .fill(Color.black).frame(width: .infinity, height: 0.50, alignment: .center)
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 358, height: 64)
                .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                .cornerRadius(5)
                .overlay(
            Text("POST")
                .font(Font.custom("Rubik-Bold", size: 32).weight(.bold))
                .foregroundColor(.black))
            Spacer()
            Spacer()
            Spacer()
        }
    }
}


#Preview {
    Add()
}
