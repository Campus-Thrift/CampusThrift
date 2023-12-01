//
//  ContentView.swift
//  Hackathon 23 Draft
//
//  Created by kai on 11/18/23.
//

import SwiftUI

struct Home: View {
    
    @State private var isLiked = false
    
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
            Rectangle().fill(Color.black).frame(width: 700, height: 1, alignment: .center)
            Spacer()
            Spacer()
            HStack(spacing: 130) {
                Text("Following")
                    .font(Font.custom("Inria Serif", size: 16))
                    .foregroundColor(.black)
                    .offset(x: -5)
                Text("Public")
                    .font(Font.custom("Inria Serif", size: 16))
                    .foregroundColor(.black)
                    .offset(x: -17)
            }
            ZStack  {
                Rectangle().fill(Color.black).frame(width: 700, height: 0.50, alignment: .center)
                Rectangle().fill(Color.black).frame(width: 114, height: 2.5, alignment: .center)
                    .offset(x: -92)
            }
            Spacer()
            Spacer()
            ScrollView(.vertical, showsIndicators: true) {
                LazyVGrid(columns: columns, spacing: 17) {
                    ForEach(sampleImages, id: \.self) { image in
                        VStack {
                            ZStack() {
                                Image(image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 170, height: 170)
                                    .clipShape(RoundedRectangle(cornerRadius: 5))
                                Button(action: {
                                    self.isLiked.toggle()
                                }) {
                                    Image(systemName: isLiked ? "heart.fill" : "heart")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 25, height: 25)
                                        .foregroundColor(isLiked ? .red : .gray)
                                        .offset(x: 63, y: 65)
                                }
                            }
                            Text("Lorem ipsum")
                                .font(Font.custom("Rubik", size: 16).weight(.light))
                                .foregroundColor(Color(red: 0.16, green: 0.18, blue: 0.20))
                            Text("$0.00")
                                .font(Font.custom("Rubik", size: 16).weight(.light))
                                .foregroundColor(Color(red: 0.16, green: 0.18, blue: 0.20))
                        }
                    }
                }
            }
            Spacer()
            Spacer()
            //navigation bar line
            Rectangle()
                .fill(Color.black)
                .frame(width: 700, height: 1, alignment: .bottom)
//                .offset(y: 363)
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
    Home()
}







