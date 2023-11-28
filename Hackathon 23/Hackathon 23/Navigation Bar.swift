//
//  Navigation Bar.swift
//  Hackathon 23
//
//  Created by kai on 11/28/23.
//

import SwiftUI

struct NavigationBarandHeader: View {
    
    var body: some View {
        
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
}


