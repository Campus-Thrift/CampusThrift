//
//  ProfileLikes.swift
//  Hackathon 23
//
//  Created by kai on 11/28/23.
//

import SwiftUI

struct ProfileListings: View {
    
    let columns = [GridItem(.fixed(170), spacing: 17), GridItem(.fixed(170), spacing: 17)]
    
    private let sampleImages = [ "image1",
                                 "image2",
                                 "image3",
                                 "image4",
                                 "image5",
                                 "image6",
                                 "image7",
                                 "image8",
                                 "image9",
                                 "image10"
    ]
    var body: some View {
        //App name and lines
        VStack() {                //textual directions
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
            Spacer()
            Spacer()
            Image("user")
                .resizable()
                .scaledToFill()
                .frame(width: 99, height: 99)
            Text("Lorem ipsum")
                .font(Font.custom("Rubik-Light", size: 32).weight(.light))
                .foregroundColor(.black)
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 97, height: 29)
                .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                .cornerRadius(5)
                .overlay(
            Text("Edit Profile")
                .font(Font.custom("Rubik", size: 16).weight(.light))
                .foregroundColor(.black))
            Spacer()
            Spacer()
            HStack(spacing: 35) {
                Text("Listings")
                    .font(Font.custom("Rubik-Light", size: 16).weight(.light))
                    .foregroundColor(.black)
                Text("Purchases")
                    .font(Font.custom("Rubik-Light", size: 16).weight(.light))
                    .foregroundColor(.black)
                Text("Following")
                    .font(Font.custom("Rubik-Light", size: 16).weight(.light))
                    .foregroundColor(.black)
                Text("Likes")
                    .font(Font.custom("Rubik-Light", size: 16).weight(.light))
                    .foregroundColor(.black)
            }
            ZStack  {
                Rectangle().fill(Color.black).frame(width: 700, height: 0.50, alignment: .center)
                Rectangle().fill(Color.black).frame(width: 98.25, height: 2.5, alignment: .trailing)
                    .offset(x: -147)
            }
            Image("pencil")
                .resizable()
                .scaledToFill()
                .frame(width: 18, height: 18)
                .offset(x: 165)
            Spacer()
            ScrollView(.vertical, showsIndicators: true) {
                LazyVGrid(columns: columns, spacing: 17) {
                    ForEach(sampleImages, id: \.self) { image in
                        VStack() {
                            Image(image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 170, height: 170)
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                            Text("Lorem ipsum\n$0.00")
                                .font(Font.custom("Rubik", size: 14).weight(.light))
                                .foregroundColor(Color(red: 0.16, green: 0.18, blue: 0.20))
                                .offset(x: -40)
                        }
                    }
                }
            }
            Spacer()
            Rectangle().fill(Color.black).frame(width: 700, height: 1, alignment: .bottom)
            Spacer()
            Spacer()
            HStack(spacing: 110) {
                //house icon
                Image("home")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 32, height: 32)

                //plus icon
                Image("plus")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 34, height: 34)

                //person icon
                Image("profile")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 32, height: 31)
            }
            .overlay(            //nav bar rectangle
                Rectangle()
                    .foregroundColor(.white)
                    .frame(width: 393, height: 66)
                    .offset(y: 396))
        }
        }
    }

    #Preview {
        ProfileListings()
    }
