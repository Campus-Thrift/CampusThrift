//
//  Checkout.swift
//  Hackathon 23
//
//  Created by kai on 11/28/23.
//

import SwiftUI

struct Checkout: View {
    @State private var phoneNumber: String = ""
    @State private var email: String = ""
    
    @State private var cardName: String = ""
    @State private var cardNum: String = ""
    @State private var expMonth: String = ""
    @State private var expYr: String = ""
    @State private var cvv: String = ""
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var address: String = ""
    @State private var city: String = ""
    @State private var state: String = ""
    @State private var zipCode: String = ""
    
    var body: some View {
        ZStack {
            
            //Header
            Text("Checkout")
                .font(Font.custom("Rubik", size: 32).weight(.light))
                .foregroundColor(.black)
                .offset(x: 0, y: -341)
            Rectangle().fill(Color.black).frame(width: .infinity, height: 1, alignment: .center)
                .offset(x: 1, y: -309)
            
            ScrollView(.vertical, showsIndicators: true) {
                
//                TextField(text: $email, prompt: Text("Required")) {
//                        Text("Email")
//                    }
                Group {
                    Text("Contact Information")
                        .font(Font.custom("Rubik-Light", size: 20).weight(.light))
                        .foregroundColor(.black)
                        .offset(x: -90, y: -2.5)
                    Spacer()
                    Text("Phone number")
                        .font(Font.custom("Rubik-Light", size: 14).weight(.light))
                        .foregroundColor(.black)
                        .frame(alignment: .center)
                        .offset(x: -130)
                    TextField("  Required", text: $phoneNumber)
                        .foregroundColor(.clear)
                        .frame(width: 244, height: 35)
                        .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                        .cornerRadius(5)
                        .offset(x: -55)
                    Spacer()
                    Spacer()
                    Text("Email")
                        .font(Font.custom("Rubik-Light", size: 14).weight(.light))
                        .foregroundColor(.black)
                        .frame(alignment: .leading)
                        .offset(x: -155)
                    TextField("  Required", text: $email)
                        .foregroundColor(.clear)
                        .frame(width: 244, height: 35)
                        .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                        .cornerRadius(5)
                        .offset(x: -55)
                    Spacer()
                    Rectangle().fill(Color.black).frame(width: .infinity, height: 0.50, alignment: .center)
                        .offset(y: 9)
                }; Group {
                    Spacer()
                    Spacer()
                    Text("Payment Method")
                        .font(Font.custom("Rubik-Light", size: 20).weight(.light))
                        .foregroundColor(.black)
                        .offset(x: -100, y: 10)
                    Spacer()
                    Spacer()
                    Text("Add Credit/Debit Card ")
                        .font(Font.custom("Rubik-Light", size: 14).weight(.light))
                        .foregroundColor(.black)
                        .frame(alignment: .center)
                        .offset(x: -100, y: 3)
                    Spacer()
                    Spacer()
                    TextField("Cardholder Name", text: $cardNum)
                        .foregroundColor(.clear)
                        .frame(width: 358, height: 35)
                        .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                        .cornerRadius(5)
//                        .offset(y: 2)
                        .multilineTextAlignment(.center)
//                    Spacer()
                    Spacer()
                    TextField("Card Number", text: $cardNum)
                        .foregroundColor(.clear)
                        .frame(width: 358, height: 35)
                        .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                        .cornerRadius(5)
//                        .offset(y: 2)
                        .multilineTextAlignment(.center)
//                    Spacer()
                    Spacer()
                    HStack(spacing: 9) {
                        TextField("Exp Month", text: $expMonth)
                            .foregroundColor(.clear)
                            .frame(width: 113, height: 35)
                            .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                            .cornerRadius(5)
//                            .offset(x:-116, y: 2)
                            .multilineTextAlignment(.center)
                        TextField("Exp Year", text: $expYr)
                            .foregroundColor(.clear)
                            .frame(width: 113, height: 35)
                            .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                            .cornerRadius(5)
//                            .offset(x:-116, y: 2)
                            .multilineTextAlignment(.center)
                        TextField("CVV", text: $cvv)
                            .foregroundColor(.clear)
                            .frame(width: 113, height: 35)
                            .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                            .cornerRadius(5)
//                            .offset(x:-116, y: 2)
                            .multilineTextAlignment(.center)
                    }
                    .offset(y: 1)
                    Spacer()
                    Spacer()
                    Text("Billing Address")
                        .font(Font.custom("Rubik-Light", size: 14).weight(.light))
                        .foregroundColor(.black)
                        .frame(alignment: .center)
                        .offset(x: -121, y: 5)
                    Spacer()
                    Spacer()
                    HStack(spacing: 9) {
                        TextField("First Name", text: $firstName)
                            .foregroundColor(.clear)
                            .frame(width: 175, height: 35)
                            .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                            .cornerRadius(5)
                        //                            .offset(x:-116, y: 2)
                            .multilineTextAlignment(.center)
                        TextField("Last Name", text: $lastName)
                            .foregroundColor(.clear)
                            .frame(width: 175, height: 35)
                            .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                            .cornerRadius(5)
                            .multilineTextAlignment(.center)
                    }
                    TextField("Address", text: $address)
                        .foregroundColor(.clear)
                        .frame(width: 358, height: 35)
                        .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                        .cornerRadius(5)
//                        .offset(y: 2)
                        .multilineTextAlignment(.center)
//                    Spacer()
                    Spacer()
                    HStack(spacing: 9) {
                        TextField("City", text: $city)
                            .foregroundColor(.clear)
                            .frame(width: 113, height: 35)
                            .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                            .cornerRadius(5)
//                            .offset(x:-116, y: 2)
                            .multilineTextAlignment(.center)
                        TextField("State", text: $state)
                            .foregroundColor(.clear)
                            .frame(width: 113, height: 35)
                            .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                            .cornerRadius(5)
//                            .offset(x:-116, y: 2)
                            .multilineTextAlignment(.center)
                        TextField("Zip Code", text: $zipCode)
                            .foregroundColor(.clear)
                            .frame(width: 113, height: 35)
                            .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                            .cornerRadius(5)
//                            .offset(x:-116, y: 2)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                    Rectangle().fill(Color.black).frame(width: .infinity, height: 0.50, alignment: .center)
                        .offset(y: 14)
                    Spacer()
                    Spacer()
                    Text("Review Items")
                        .font(Font.custom("Rubik-Light", size: 20).weight(.light))
                        .foregroundColor(.black)
                        .offset(x: -110, y: 10)
                    Spacer()
                    Spacer()
                    Spacer()
                    Image("image5")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 70, height: 70)
                        .cornerRadius(5)
                        .offset(x: -135)
                }
            }
            .offset(x: 0, y: 120)
            .frame(alignment: .leading)
            
            //line & checkout button
            Rectangle().fill(Color.black).frame(width: .infinity, height: 0.50, alignment: .center)
                .offset(x: 0, y: 260)
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 358, height: 64)
                .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                .cornerRadius(5)
                .offset(x: 0.50, y: 312)
            Text("PLACE ORDER")
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
    Checkout()
}
