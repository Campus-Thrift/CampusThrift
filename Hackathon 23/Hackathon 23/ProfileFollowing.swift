//
//  ProfileFollowing.swift
//  Hackathon 23
//
//  Created by kai on 11/28/23.
//

import SwiftUI

struct ProfileFollowing: View {
  @State private var following = [User]()

  func fetchFollowing() {
    // Simulate fetching following data from the backend
    let followingData = [
      User(name: "John Doe", profileImageURL: "https://via.placeholder.com/34x33"),
      User(name: "Jane Doe", profileImageURL: "https://via.placeholder.com/30x30"),
      User(name: "Peter Jones", profileImageURL: "https://via.placeholder.com/32x32"),
    ]
    self.following = followingData
  }

  func unfollow(user: User) {
    // Simulate unfollowing a user
    self.following.removeAll { $0 == user }
  }

  var body: some View {
    NavigationView {
      List(following) { user in
        HStack {
          AsyncImage(url: URL(string: user.profileImageURL))
            .frame(width: 30, height: 30)

          Text(user.name)

          Spacer()

          Button("Unfollow") {
            unfollow(user: user)
          }
          .foregroundColor(.red)
        }
      }
      .navigationTitle("Following")
    }
    .onAppear(perform: fetchFollowing)
  }
}

struct User: Identifiable {
  let id = UUID()
  let name: String
  let profileImageURL: String
}
