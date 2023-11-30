//
//  OthersProfile.swift
//  Hackathon 23
//
//  Created by kai on 11/28/23.
//

import SwiftUI

struct OtherProfile: View {
    @State var isFollowing: Bool = false
    @State var userPosts: [Post] = []
    let userId: String

    var body: some View {
        ZStack {
            Color.white

            VStack {
                // Profile picture
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 99, height: 99)
                    .background(AsyncImage(url: URL(string: "https://via.placeholder.com/99x99")))
                    .offset(x: 0, y: -286.5)

                // Username
                Text("Lorem ipsum")
                    .font(Font.custom("Rubik", size: 32).weight(.light))
                    .foregroundColor(Color(red: 0.16, green: 0.18, blue: 0.20))
                    .offset(x: 0, y: -209)

                // Follow/Following button
                HStack(spacing: 10) {
                    Button(isFollowing ? "Following" : "Follow") {
                        if isFollowing {
                            unfollowUser()
                        } else {
                            followUser()
                        }
                    }
                    .foregroundColor(isFollowing ? .gray : .blue)
                    .padding()
                    .background(
                        Color(red: 0.85, green: 0.85, blue: 0.85)
                    )
                    .cornerRadius(5)

                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 17, height: 17)
                        .background(
                            AsyncImage(url: URL(string: "https://via.placeholder.com/17x17")))
                        .offset(x: -30, y: 0)
                }
                .offset(x: 0, y: -165.5)

                // User's posts
                ScrollView(.vertical) {
                    VStack(spacing: 20) {
                        ForEach(userPosts) { post in
                            // Post preview with image, description, price
                            PostPreview(post: post)
                        }
                    }
                    .padding()
                }
                .onAppear {
                    fetchUserPosts()
                }
            }

            // Navigation to individual post pages
            // ...
        }
        .frame(width: 393, height: 852)
    }

    private func fetchUserPosts() {
        // Implement code to fetch user's posts from API or database
        // Update userPosts state array with fetched posts
    }

    private func followUser() {
        // Implement code to follow the user using API or database
        // Update isFollowing state variable to true
    }

    private func unfollowUser() {
        // Implement code to unfollow the user using API or database
        // Update isFollowing state variable to false
    }
}

struct PostPreview: View {
    let post: Post

    var body: some View {
        HStack {
            AsyncImage(url: post.imageURL)
                .frame(width: 170, height: 170)
                .cornerRadius(5)

            VStack(alignment: .leading) {
                Text(post.description)
                    .font(Font.custom("Rubik", size: 14).weight(.light))
                    .foregroundColor(Color(red: 0.16, green: 0.18, blue: 0.20))

                Text("$" + post.price.description)
                    .font(Font.custom("Rubik", size: 14).weight(.light))
                    .foregroundColor(Color(red: 0.16, green: 0.18, blue: 0.20))
            }
        }
    }
}
