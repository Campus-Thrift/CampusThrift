//
//  Shopping Cart.swift
//  Hackathon 23
//
//  Created by kai on 11/28/23.
//

import SwiftUI

//struct CartRowView:Identifiable {
//    var id: ObjectIdentifier
//    var itemImage: String
//    var itemName: String
//    var itemPrice: String
//    var itemCondition: String
//    var itemSize: String
//}

struct ShoppingCart: View {
    
//    let columns = [GridItem(.fixed(393)), GridItem(.fixed(170))]
    
//    var sampleCartItem = [
//        CartRowView(id: ObjectIdentifier, itemImage: "image1", itemName: "Men’s Black T-Shirt", itemPrice: "5.00", itemCondition: "used", itemSize: "S"),
//        CartRowView(id: 2, itemImage: "image5", itemName: "Beige Heels", itemPrice: "7.00", itemCondition: "like new", itemSize: "7")
//    ]
    
    private var scrollViewContentSize: CGSize = .init(width: 393, height: 600)
    
    var body: some View {
        ZStack() {
            //Header
            Text("Shopping Cart")
                .font(Font.custom("Rubik", size: 32).weight(.light))
                .foregroundColor(.black)
                .offset(x: 0, y: -341)
            Rectangle().fill(Color.black).frame(width: .infinity, height: 1, alignment: .center)
                .offset(x: 1, y: -309)
            
            ScrollView(.vertical, showsIndicators: true) {
                LazyVStack(spacing: 12) {
                    //                    Section {
                    //                        ForEach(cartItem) { sampleCartItem in
                    //                        Image(CartRowView.itemImage)
                    Image("image5")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 118, height: 118)
                        .cornerRadius(5)
                        .offset(x: -119, y: 130)
                    //                        Text(CartRowView.itemName)
                    Text("Men's Black T-Shirt")
                        .font(Font.custom("Rubik-Medium", size: 16).weight(.light))
                        .foregroundColor(Color(red: 0.16, green: 0.18, blue: 0.20))
                        .offset(x: 21, y: 3)
                    //                        Text(CartRowView.itemPrice)
                    VStack(spacing: 12) {
                        HStack(spacing: 80) {
                            HStack(spacing: 3) {
                                //                    Label(person.phoneNumber, systemImage: "phone")
                                Text("Size")
                                    .font(Font.custom("Rubik-Medium", size: 14).weight(.light))
                                    .foregroundColor(.black)
                                //                            .offset(x: 21, y: -255)
                                //                            Text(CartRowView.itemSize)
                                Text("S")
                                    .font(Font.custom("Rubik-Bold", size: 14).weight(.bold))
                                    .foregroundColor(.black)
                                //                            .offset(x: 21, y: 65)
                            }
                            HStack(spacing: 3) {
                                //                    Label(CartRowView.itemCondition, systemImage: "phone")
                                Text("Condition")
                                    .font(Font.custom("Rubik-Medium", size: 14).weight(.light))
                                    .foregroundColor(.black)
                                //                            .offset(x: 102.50, y: 65)
                                //                            Text(CartRowView.itemCondition)
                                Text("used")
                                    .font(Font.custom("Rubik-Bold", size: 14).weight(.bold))
                                    .foregroundColor(.black)
                                //                            .offset(x: 154.50, y: 65)
                            }
//                            .offset(x: 40)
                        }
                        .offset(x: 57, y: 45)
                        
                        HStack(spacing: 165) {
                            Text("$5.00")
                                .font(Font.custom("Rubik-Medium", size: 14).weight(.light))
                                .foregroundColor(Color(red: 0.16, green: 0.18, blue: 0.20))
                            //                            .offset(x: 90, y: 101)
                            Image("trash-can")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 12, height: 13)
//                                .offset(x: 25)
                        }
                        .offset(x: 57, y: 35)
                    }
                }
            }
            //            }
            .listRowSeparator(/*@START_MENU_TOKEN@*/.visible/*@END_MENU_TOKEN@*/)
            .frame(maxWidth: scrollViewContentSize.width)
            
            //line & checkout button
            Rectangle().fill(Color.black).frame(width: .infinity, height: 0.50, alignment: .center)
                .offset(x: 0, y: 260)
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 358, height: 64)
                .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                .cornerRadius(5)
                .offset(x: 0.50, y: 312)
            Text("CHECKOUT")
                .font(Font.custom("Rubik-Bold", size: 32).weight(.bold))
                .foregroundColor(.black)
                .offset(x: 0.50, y: 312)
            NavigationBarandHeader()
    }
        .padding(.bottom, 20.0)
        .frame(width: 393, height: 852)
        .background(.white);
    }
}

#Preview {
    ShoppingCart()
}



