//
//  ProfileLikes.swift
//  Hackathon 23
//
//  Created by kai on 11/28/23.
//

import SwiftUI

struct LikedItems: View {
    @State private var likedItems = [Item]()

    var body: some View {
        ZStack {
            List {
                ForEach(likedItems) { item in
                    LikedItemRowView(item: item)
                }
                .listRowSeparator(.visible)
            }
            .frame(maxWidth: 393)

            // Header
            Text("Liked Items")
                .font(Font.custom("Rubik", size: 32).weight(.light))
                .foregroundColor(.black)
                .offset(x: 0, y: -341)
            Rectangle()
                .fill(Color.black)
                .frame(width: .infinity, height: 1, alignment: .center)
                .offset(x: 1, y: -309)
        }
        .padding(.bottom, 20.0)
        .frame(width: 393, height: 852)
        .background(.white);

        // Load liked items when the view appears
        .onAppear {
            loadLikedItems()
        }
    }

    private func loadLikedItems() {
        // Simulate loading liked items from a backend server
        let likedItems = [
            Item(id: 1, name: "Men's Black T-Shirt", description: "A classic black t-shirt made from soft cotton.", price: "5.00", imageURL: "image1"),
            Item(id: 2, name: "Beige Heels", description: "Elegant beige heels with a comfortable heel height.", price: "7.00", imageURL: "image5")
        ]

        self.likedItems = likedItems
    }
}

struct LikedItemRowView: View {
    let item: Item

    var body: some View {
        HStack(spacing: 16) {
            AsyncImage(url: URL(string: item.imageURL)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .cornerRadius(5)
            }
            .placeholder {
                ProgressView()
            }

            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.black)

                Text(item.description)
                    .font(.body)
                    .foregroundColor(.gray)

                Spacer()

                Text(item.price)
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            }

            Spacer()

            LikeButton()
        }
        .padding(.horizontal)
    }
}

struct Item: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let price: String
    let imageURL: String
}
