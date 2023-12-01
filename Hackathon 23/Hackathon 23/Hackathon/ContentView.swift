//
//  ContentView.swift
//  Hackathon 23
//
//  Created by kai on 11/30/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Home()
                .tabItem{
                    Label("Home", systemImage: "house")
                }
            Add()
                .tabItem{
                    Label("Post", systemImage: "plus")
                }
            ProfileLikes()
                .tabItem{
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

#Preview {
    ContentView()
}
