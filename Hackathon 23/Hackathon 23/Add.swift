//
//  Add.swift
//  Hackathon 23
//
//  Created by kai on 11/28/23.
//

import SwiftUI

struct Add: View {
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
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 348, height: 291)
                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                    .cornerRadius(5)
                    .offset(x: -0.50, y: -145)
            };Group {
                Text("Enter Title")
                    .font(Font.custom("Rubik", size: 32).weight(.light))
                    .foregroundColor(Color(red: 0.16, green: 0.18, blue: 0.20))
                    .offset(x: 0.50, y: 32)
                Text("Size")
                    .font(Font.custom("Rubik", size: 24).weight(.light))
                    .foregroundColor(Color(red: 0.35, green: 0.36, blue: 0.37))
                    .offset(x: -150, y: 80)
                Text("Condition")
                    .font(Font.custom("Rubik", size: 24).weight(.light))
                    .foregroundColor(Color(red: 0.35, green: 0.36, blue: 0.37))
                    .offset(x: -122, y: 130)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 92, height: 35)
                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                    .cornerRadius(5)
                    .offset(x: 123.50, y: 130)
            };Group {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 92, height: 35)
                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                    .cornerRadius(5)
                    .offset(x: 123.50, y: 80)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 92, height: 35)
                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                    .cornerRadius(5)
                    .offset(x: 123.50, y: 180)
                Text("Price")
                    .font(Font.custom("Rubik", size: 24).weight(.light))
                    .foregroundColor(Color(red: 0.35, green: 0.36, blue: 0.37))
                    .offset(x: -144, y: 180)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 92, height: 35)
                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                    .cornerRadius(5)
                    .offset(x: 123.50, y: 230)
                Text("Pickup Location")
                    .font(Font.custom("Rubik", size: 24).weight(.light))
                    .foregroundColor(Color(red: 0.35, green: 0.36, blue: 0.37))
                    .offset(x: -85.50, y: 230)
                //line & checkout button
                Rectangle().fill(Color.black).frame(width: .infinity, height: 0.50, alignment: .center)
                    .offset(x: 0, y: 260)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 358, height: 64)
                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                    .cornerRadius(5)
                    .offset(x: 0.50, y: 312)
                Text("POST")
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
    Add()
}

