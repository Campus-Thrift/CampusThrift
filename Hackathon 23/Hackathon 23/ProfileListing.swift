//
//  ProfileListing.swift
//  Hackathon 23
//
//  Created by kai on 11/28/23.
//

import SwiftUI

struct ProfileListings: View {
  @State private var isEditingListings = false
  @State private var showDeleteConfirmation = false
  @State private var selectedListingIndex: Int?

  var body: some View {
    ZStack {
      if isEditingListings {
        editListingsView
      } else {
        defaultView
      }

      Button("Edit Listings") {
        isEditingListings.toggle()
      }
      .font(Font.custom("Rubik", size: 16).weight(.light))
      .foregroundColor(.black)
      .offset(x: 0, y: -210)
    }
    .frame(width: 393, height: 852)
    .background(.white)
  }

  private var editListingsView: some View {
    VStack {
      ForEach(0..<4, id: \.self) { index in
        HStack {
          Button {
            selectedListingIndex = index
            showDeleteConfirmation = true
          } label: {
            Image(systemName: "trash.fill")
              .font(.system(size: 18))
              .foregroundColor(.red)
              .padding(.trailing, 10)
          }

          Text("Listing \(index + 1)")
            .font(Font.custom("Rubik", size: 14).weight(.light))
            .foregroundColor(Color(red: 0.16, green: 0.18, blue: 0.20))
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background(Color.gray.opacity(0.2))
      }
    }

    if showDeleteConfirmation {
      Alert(title: Text("Delete Listing"),
            message: Text("Are you sure you want to delete this listing?"),
            primaryButton: .destructive(Text("Delete")) {
              // Delete the selected listing
              selectedListingIndex = nil
              showDeleteConfirmation = false
            },
            secondaryButton: .cancel {
              showDeleteConfirmation = false
            })
    }
  }

  private var defaultView: some View {
    VStack {
      // Profile information
      // ...

      // Listings
      VStack {
        ForEach(0..<4, id: \.self) { index in
          HStack {
            Image(systemName: "bookmark.fill")
              .font(.system(size: 18))
              .foregroundColor(.blue)
              .padding(.trailing, 10)

            Text("Listing \(index + 1)")
              .font(Font.custom("Rubik", size: 14).weight(.light))
              .foregroundColor(Color(red: 0.16, green: 0.18, blue: 0.20))
          }
          .padding(.horizontal)
          .padding(.vertical, 10)
          .background(Color.gray.opacity(0.2))
        }
      }
      .padding(.horizontal)
    }
  }
}


struct Profile: View {
    var body: some View {
        Text("Profile")
            .font(Font.custom("Rubik-Light", size: 32).weight(.light))
            .foregroundColor(.black)
            .offset(x: 0, y: -341)
    }
}

#Preview {
    ProfileListings()
}
