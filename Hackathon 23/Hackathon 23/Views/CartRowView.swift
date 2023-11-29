////
////  CartRowView.swift
////  Hackathon 23
////
////  Created by kai on 11/28/23.
////
//
//import SwiftUI
//
//
//
////struct CartRowView: Identifiable {
//    let id = UUID()
//    var itemImage: String
//    var itemName: String
//    var itemPrice: String
//    var itemCondition: String
//    var itemSize: String
//}
//
//struct cartItemList: View {
//    var body: some View {
//        List {
//            ForEach(cartItem) { CartRowView in
//                Image(CartRowView.itemImage)
//                    .resizable()
//                    .scaledToFill()
//                    .frame(width: 118, height: 118)
//                    .cornerRadius(5)
//                    .offset(x: -113.50, y: -281)
//                Text(CartRowView.itemName)
//                    .font(Font.custom("Rubik", size: 16).weight(.light))
//                    .foregroundColor(Color(red: 0.16, green: 0.18, blue: 0.20))
//                Text(CartRowView.itemPrice)
//                    .font(Font.custom("Rubik", size: 14).weight(.light))
//                    .foregroundColor(Color(red: 0.16, green: 0.18, blue: 0.20))
//                    .offset(x: -26, y: -231)
//                HStack(spacing: 2) {
////                    Label(person.phoneNumber, systemImage: "phone")
//                    Text("Size")
//                        .font(Font.custom("Rubik", size: 14).weight(.light))
//                        .foregroundColor(.black)
//                        .offset(x: -30.50, y: -255)
//                    Text(CartRowView.itemSize)
//                        .font(Font.custom("Rubik", size: 14).weight(.bold))
//                        .foregroundColor(.black)
//                        .offset(x: -7.50, y: -255)
//                }
//                HStack(spacing: 3) {
////                    Label(CartRowView.itemCondition, systemImage: "phone")
//                    Text("Condition")
//                        .font(Font.custom("Rubik", size: 14).weight(.light))
//                        .foregroundColor(.black)
//                        .offset(x: 102.50, y: -255)
//                    Text(CartRowView.itemCondition)
//                        .font(Font.custom("Rubik", size: 14).weight(.bold))
//                        .foregroundColor(.black)
//                        .offset(x: 154.50, y: -255.50)
//                }
//            }
//        }
//    }
//}
//
//var cartItem = [
//    CartRowView(itemImage: "image1", itemName: "Men’s Black T-Shirt", itemPrice: "5.00", itemCondition: "used", itemSize: "S"),
//    CartRowView(itemImage: "image5", itemName: "Beige Heels", itemPrice: "7.00", itemCondition: "like new", itemSize: "7")
//]
//
//
////Image(image)
////    .resizable()
////    .scaledToFill()
////    .frame(width: 118, height: 118)
////    .cornerRadius(5)
////    .offset(x: -113.50, y: -281)
////Text("Men’s White T-Shirt")
////    .font(Font.custom("Rubik", size: 16).weight(.light))
////    .foregroundColor(Color(red: 0.16, green: 0.18, blue: 0.20))
////    .offset(x: 24, y: -328)
////Text("$5.00")
////    .font(Font.custom("Rubik", size: 14).weight(.light))
////    .foregroundColor(Color(red: 0.16, green: 0.18, blue: 0.20))
////    .offset(x: -26, y: -231)
//
//
//
////Rectangle()
////    .foregroundColor(.clear)
////    .frame(width: 12, height: 13)
////    .background(
////        AsyncImage(url: URL(string: "https://via.placeholder.com/12x13")))
////    .offset(x: 165.50, y: -231.50)
//
//
//
////Text("Size")
////    .font(Font.custom("Rubik", size: 14).weight(.light))
////    .foregroundColor(.black)
////    .offset(x: -30.50, y: -255)
////Text("S")
////    .font(Font.custom("Rubik", size: 14).weight(.bold))
////    .foregroundColor(.black)
////    .offset(x: -7.50, y: -255)
////Text("Condition")
////    .font(Font.custom("Rubik", size: 14).weight(.light))
////    .foregroundColor(.black)
////    .offset(x: 102.50, y: -255)
////Text("used")
////    .font(Font.custom("Rubik", size: 14).weight(.bold))
////    .foregroundColor(.black)
////    .offset(x: 154.50, y: -255.50)
