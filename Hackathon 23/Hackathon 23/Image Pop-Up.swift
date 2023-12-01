//
//  Image Pop-Up.swift
//  Hackathon 23
//
//  Created by kai on 11/28/23.
//

import SwiftUI

struct ImagePopUp: View {
    var body: some View {
        ZStack() {
            Group {
                //textual directions
                Text("Campus Thrift")
                    .font(Font.custom("Rubik-Light", size: 32).weight(.light))
                    .foregroundColor(.black)
                    .offset(x: 0, y: -341)
                
                //lines
                Rectangle().fill(Color.black).frame(width: .infinity, height: 1, alignment: .center)
                    .offset(x: 1, y: -309)
                Image("image1")
                    .resizable()
                    .scaledToFill()
                    .foregroundColor(.clear)
                    .frame(width: 360, height: 365)
                    .cornerRadius(5)
                    .offset(x: 0.50, y:-65)
                LikeButtonIPU()
                    .offset(x: 161, y: 143)
            };Group {
                Text("Men’s Black T-Shirt")
                    .font(Font.custom("Rubik-Light", size: 32).weight(.light))
                    .foregroundColor(Color(red: 0.16, green: 0.18, blue: 0.20))
                    .offset(x: -35, y: 145)
                Text("Size")
                    .font(Font.custom("Rubik-Light", size: 24).weight(.light))
                    .foregroundColor(Color(red: 0.35, green: 0.36, blue: 0.37))
                    .offset(x: -148, y: 187)
                Text("Price")
                    .font(Font.custom("Rubik-Light", size: 24).weight(.light))
                    .foregroundColor(Color(red: 0.35, green: 0.36, blue: 0.37))
                    .offset(x: -143, y: 227)
                Text("$5.00")
                    .font(Font.custom("Rubik-Light", size: 24).weight(.bold))
                    .foregroundColor(.black)
                    .offset(x: -77, y: 227)
                Image("user")
                    .resizable()
                    .scaledToFill()
                    .foregroundColor(.clear)
                    .frame(width: 34, height: 34)
                    .offset(x: -161, y: -278)
                Text("Lorem ipsum")
                    .font(Font.custom("Rubik-Light", size: 32).weight(.light))
                    .foregroundColor(Color(red: 0.16, green: 0.18, blue: 0.20))
                    .offset(x: -36.50, y: -278)
                Text("L")
                    .font(Font.custom("Rubik-Light", size: 24).weight(.bold))
                    .foregroundColor(.black)
                    .offset(x: -99, y: 187)
                Text("Condition")
                    .font(Font.custom("Rubik-Light", size: 24).weight(.light))
                    .foregroundColor(Color(red: 0.35, green: 0.36, blue: 0.37))
                    .offset(x: 60, y: 187)
                Text("used")
                    .font(Font.custom("Rubik-Light", size: 24).weight(.bold))
                    .foregroundColor(.black)
                    .offset(x: 150, y: 187)
            };Group {
                //line & checkout button
                Rectangle().fill(Color.black).frame(width: .infinity, height: 0.50, alignment: .center)
                    .offset(x: 0, y: 260)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 358, height: 64)
                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                    .cornerRadius(5)
                    .offset(x: 0.50, y: 312)
                Text("ADD TO CART")
                    .font(Font.custom("Rubik-Bold", size: 32).weight(.bold))
                    .foregroundColor(.black)
                    .offset(x: 0.50, y: 312)
            }
            NavigationBarandHeader()
        }
        .padding(.bottom, 20.0)
        .frame(width: 393, height: 852)
        .background(.white)
    }
}

#Preview {
    ImagePopUp()
}
