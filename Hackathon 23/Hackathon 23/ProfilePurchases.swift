//
//  ProfilePurchases.swift
//  Hackathon 23
//
//  Created by kai on 11/28/23.
//

import SwiftUI

struct PurchaseHistory: View {
    
    @State private var purchases = [PurchasedItem]()
    
    var body: some View {
        ZStack {
            List {
                ForEach(purchases) { purchase in
                    PurchaseRowView(purchase: purchase)
                }
                .listRowSeparator(.visible)
            }
            .frame(maxWidth: 393)

            // Header
            Text("Purchase History")
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
        
        // Load purchased items when the view appears
        .onAppear {
            loadPurchases()
        }
    }
    
    private func loadPurchases() {
        // Simulate loading purchased items from a backend server
        let purchasedItems = [
            PurchasedItem(id: 1, itemImage: "image1", itemName: "Men's Black T-Shirt", itemPrice: "5.00", itemCondition: "used", itemSize: "S"),
            PurchasedItem(id: 2, itemImage: "image5", itemName: "Beige Heels", itemPrice: "7.00", itemCondition: "like new", itemSize: "7")
        ]
        
        purchases = purchasedItems
    }
}
struct NoPurchaseView: View {
    
    var body: some View {
        VStack {
            Text("You haven't made any purchases yet.")
                .font(Font.custom("Rubik", size: 24).weight(.light))
                .foregroundColor(.black)
                .padding(.bottom, 16)
            
            Text("Start shopping to fill your purchase history.")
                .font(Font.custom("Rubik", size: 16).weight(.light))
                .foregroundColor(Color(red: 0.55, green: 0.57, blue: 0.59))
                .padding(.horizontal, 40)
            
            Button("Start Shopping") {
                // Simulate navigating to the shopping page
                print("Navigating to shopping page")
            }
            .buttonStyle(PrimaryButtonStyle())
            .padding(.top, 32)
        }
        .frame(width: 393, height: 300)
        .background(.white)
    }
}

struct PurchaseRowView: View {
    
    let purchase: PurchasedItem
    
    var body: some View {
        VStack(spacing: 12) {
            HStack(spacing: 3) {
                Image(purchase.itemImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 118, height: 118)
                    .cornerRadius(5)
                    .offset(x: -119, y: 130)
                
                VStack(spacing: 12) {
                    Text(purchase.itemName)
                        .font(Font.custom("Rubik-Medium", size: 16).weight(.light))
                        .foregroundColor(Color(red: 0.16, green: 0.18, blue: 0.20))
                    
                    HStack(spacing: 80) {
                        HStack(spacing: 3) {
                            Text("Size")
                                .font(Font.custom("Rubik-Medium", size: 14).weight(.light))
                                .foregroundColor(.black)
                            
                            Text(purchase.itemSize)
                                .font(Font.custom("Rubik-Bold", size: 14).weight(.bold))
                                .foregroundColor(.black)
                        }
                        
                        HStack(spacing: 3) {
                            Text("Condition")
                                .font(Font.custom("Rubik-Medium", size: 14).weight(.light))
                                .foregroundColor(.black)
                            
                            Text(purchase.itemCondition)
                                .font(Font.custom("Rubik-Bold", size: 14).weight(.bold))
                                .foregroundColor(.black)
                        }
                    }
                    
                    HStack(spacing: 165) {
                        Text("$\(purchase.itemPrice)")
                            .font(Font.custom("Rubik-Medium", size: 14).weight(.light))
                            .foregroundColor(Color(red: 0.16, green: 0.18, blue: 0.20))
                    }
                }
            }
        }
        .listRowSeparator(.visible)
        .padding(.horizontal, 57)
    }
}

struct PurchasedItem: Identifiable {
    
    let id: Int
    let itemImage: String
    let itemName: String
    let itemPrice: String
    let itemCondition: String
    let itemSize: String
}


#Preview {
    PurchaseHistory()
}
