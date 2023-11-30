//
//  Heart Animation.swift
//  Hackathon 23
//
//  Created by kai on 11/29/23.
//

import SwiftUI

struct LikeButton: View {
    
    @State private var isLiked = false
    
    var body: some View {
        Button(action: {
            self.isLiked.toggle()
        }) {
            Image(systemName: isLiked ? "heart.fill" : "heart")
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
                .foregroundColor(isLiked ? .red : .gray)
//                .offset(x: 5, y: 5)
        }
    }

}

struct LikeButtonIPU: View {
    
    @State private var isLiked = false
    
    var body: some View {
        Button(action: {
            self.isLiked.toggle()
        }) {
            Image(systemName: isLiked ? "heart.fill" : "heart")
                .resizable()
                .scaledToFit()
                .frame(width: 36, height: 36)
                .foregroundColor(isLiked ? .red : .gray)
//                .offset(x: 5, y: 5)
        }
    }

}
