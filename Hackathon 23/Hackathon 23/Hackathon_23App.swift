//
//  Hackathon_23App.swift
//  Hackathon 23
//
//  Created by kai on 11/18/23.
//

import SwiftUI

@main
struct Hackathon_23App: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                Home()
                Add()
                Profile()
            }
        }
    }
}
