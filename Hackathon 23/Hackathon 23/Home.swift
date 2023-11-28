//
//  ContentView.swift
//  Hackathon 23 Draft
//
//  Created by kai on 11/18/23.
//

import SwiftUI

struct Home: View {
 
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
                    .font(Font.custom("Rubik-Light", size: 32).weight(.light))
                    .foregroundColor(.black)
                    .offset(x: 0.50, y: -341)
                Text("Following")
                    .font(Font.custom("Inria Serif", size: 16))
                    .foregroundColor(.black)
                    .offset(x: 99.50, y: -279.50)
                Text("Public")
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
            NavigationBarandHeader()
        }
        .padding(.bottom, 20.0)
        }
}

#Preview {
    Home()
}
