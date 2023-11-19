//
//  ContentView.swift
//  Hackathon 23 Draft
//
//  Created by kai on 11/18/23.
//

import SwiftUI

struct ContentView: View {
 
    let columns = [GridItem(.fixed(170)), GridItem(.fixed(170))]
    
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
        ZStack() {
            Group {
                //textual directions
                Text("App Name")
                    .font(Font.custom("Inria Serif", size: 32).weight(.light))
                    .foregroundColor(.black)
                    .offset(x: 0.50, y: -341)
                Text("following")
                    .font(Font.custom("Inria Serif", size: 16))
                    .foregroundColor(.black)
                    .offset(x: 99.50, y: -279.50)
                Text("public")
                    .font(Font.custom("Inria Serif", size: 16))
                    .foregroundColor(.black)
                    .offset(x: -93.50, y: -279.50)
                
                //lines
                Rectangle().fill(Color.black).frame(width: .infinity, height: 1, alignment: .center)
                    .offset(x: 1, y: -309)
                
                Rectangle().fill(Color.black).frame(width: 114, height: 2.5, alignment: .center)
                    .offset(x: -92, y: -261)
                
                Rectangle().fill(Color.black).frame(width: .infinity, height: 0.50, alignment: .center)
                    .offset(x: 0, y: -261)
            }
            
            Spacer()
            ScrollView(.vertical, showsIndicators: true) {
                LazyVGrid(columns: columns, spacing: 17) {
                    ForEach(sampleImages, id: \.self) { image in
                        
                        Image(image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 170, height: 170)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .offset(y: 105)
                    }
                }
            }
            .frame(maxHeight: 690)
            //cornell logo
            Image("cornell")
                .resizable()
                .scaledToFill()
                .frame(width: 34.10, height: 33)
                .offset(x: -161.45, y: -394.50)
                .padding([.top, .leading, .trailing])
            
            //shopping cart
            Image("shopping-cart")
                .resizable()
                .scaledToFill()
                .frame(width: 30, height: 30)
                .offset(x: 168.50, y: -396)
                .padding([.top, .trailing])
            
            //nav bar rectangle
            Rectangle()
                .foregroundColor(.white)
              .frame(width: 393, height: 66)
              .offset(y: 396)
            
            //navigation bar line
            Rectangle().fill(Color.black).frame(width: .infinity, height: 1, alignment: .bottom)
                .offset(y: 363)
            
            //house icon
            Image("home")
                .resizable()
                .scaledToFill()
                .frame(width: 32, height: 32)
                .offset(x: -132.50, y: 396)
            
            //plus icon
            Image("plus")
                .resizable()
                .scaledToFill()
                .frame(width: 34, height: 34)
                .offset(y: 396)
            
            //person icon
            Image("profile")
                .resizable()
                .scaledToFill()
                .frame(width: 32, height: 31)
                .offset(x: 135.5, y: 396)
        }
        .padding(.bottom, 20.0)
        }
}


#Preview {
    ContentView()
}
