//
//  ContentView.swift
//  Hackathon 23
//
//  Created by kai on 11/18/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack() {
            
  //App name and lines
            Group {
                Text("App Name")
                    .font(Font.custom("Inria Serif", size: 32).weight(.light))
                    .foregroundColor(.black)
                    .offset(x: 0.50, y: -337)
                //lines
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 393, height: 0)
                    .overlay(Rectangle()
                        .stroke(.black, lineWidth: 0.50))
                    .offset(x: 1, y: -309)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 393, height: 0)
                    .overlay(
                        Rectangle()
                            .stroke(
                                Color(red: 0, green: 0, blue: 0).opacity(0.25), lineWidth: 0.50
                            )
                    )
                    .offset(x: 0, y: -261)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 393, height: 0)
                    .overlay(Rectangle()
                        .stroke(.black, lineWidth: 0.50))
                    .offset(x: 0, y: 370)
    
//Images and hearts
            }; Group {
                
                //R1-1
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 170, height: 170)
                    .background(
                        AsyncImage(url: URL(string: "https://via.placeholder.com/170x170"))
                    )
                    .cornerRadius(5)
                    .offset(x: -93.50, y: -136)
                ZStack() {
                    Text("N")
                }
                .frame(width: 21, height: 21)
                .offset(x: -28, y: -68.50)
                
                //R3-2
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 170, height: 170)
                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                    .cornerRadius(5)
                    .offset(x: 93.50, y: 246)
                ZStack() {
                    
                }
                .frame(width: 21, height: 21)
                .offset(x: 159, y: 313.50)
                
                //R2-2
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 170, height: 170)
                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                    .cornerRadius(5)
                    .offset(x: 93.50, y: 55)
                ZStack() {
                    
                }
                .frame(width: 21, height: 21)
                .offset(x: 157, y: 122.50)
                //          };Group {
                //R3-1
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 170, height: 170)
                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                    .cornerRadius(5)
                    .offset(x: -93.50, y: 246)
                ZStack() {
                    
                }
                .frame(width: 21, height: 21)
                .offset(x: -28, y: 313.50)
                
                //R2-1
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 170, height: 170)
                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                    .cornerRadius(5)
                    .offset(x: -93.50, y: 55)
                ZStack() {
                    
                }
                .frame(width: 21, height: 21)
                .offset(x: -28, y: 122.50)
                
                //R1-2
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 170, height: 170)
                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                    .cornerRadius(5)
                    .offset(x: 93.50, y: -136)
                ZStack() {
                    
                }
                .frame(width: 21, height: 21)
                .offset(x: 159, y: -68.50)
                
                
//Top icons and public/following
            };Group {
                //cornell logo
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 34.10, height: 33)
                    .background(
                        AsyncImage(url: URL(string: "https://via.placeholder.com/34x33"))
                    )
                    .offset(x: -161.45, y: -394.50)
                    .padding([.top, .leading, .trailing])
                
                //shopping cart
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 30, height: 30)
                    .background(
                        AsyncImage(url: URL(string: "https://via.placeholder.com/30x30"))
                    )
                    .offset(x: 168.50, y: -396)
                    .padding([.top, .trailing])
                
                Text("following")
                    .font(Font.custom("Inria Serif", size: 16))
                    .foregroundColor(.black)
                    .offset(x: 99.50, y: -279.50)
                Text("public")
                    .font(Font.custom("Inria Serif", size: 16))
                    .foregroundColor(.black)
                    .offset(x: -93.50, y: -279.50)
        // navigation bar
            };Group {
                //navigation bar line
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 114, height: 0)
                    .overlay(Rectangle()
                        .stroke(.black, lineWidth: 1))
                    .offset(x: -93.50, y: -261.98)
                
                //house icon
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 32, height: 32)
                    .background(
                        AsyncImage(url: URL(string: "https://via.placeholder.com/32x32"))
                    )
                    .offset(x: -132.50, y: 399)
                
                //plus icon
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 34, height: 34)
                    .background(
                        AsyncImage(url: URL(string: "https://via.placeholder.com/34x34"))
                    )
                    .offset(x: -0.50, y: 400)
                
                //person icon
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 32, height: 31)
                    .background(
                        AsyncImage(url: URL(string: "https://via.placeholder.com/32x31"))
                    )
                    .offset(x: 132.50, y: 398.50)
            }
            .padding(.bottom, 20.0)
        }
        .frame(width: 393, height: 852)
        .background(.white)
    }
}

#Preview {
    ContentView()
}
