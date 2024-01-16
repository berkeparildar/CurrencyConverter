//
//  ContentView.swift
//  CurrencyConverter
//
//  Created by Berke Parıldar on 16.01.2024.
//

import SwiftUI

struct ContentView: View {
    let background : Color = Color(red: 18/255, green: 18/255, blue: 18/255)
    let darkGrey : Color = Color(red: 33/255, green: 33/255, blue: 33/255)
    let grey : Color = Color(red: 83/255, green: 83/255, blue: 83/255)
    let lightGrey : Color = Color(red: 179/255, green: 179/255, blue: 179/255)
    let green : Color = Color(red: 29/255, green: 185/255, blue: 84/255)
    @State var upAmount: String = ""
    var body: some View {
        ZStack {
            Color(background).edgesIgnoringSafeArea(.all)
            VStack {
                VStack {
                    Text("Currency Converter")
                        .font(.largeTitle)
                    Image(systemName: "coloncurrencysign.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                }
                .foregroundStyle(lightGrey)
                .padding()
                Spacer()
                HStack {
                    Rectangle()
                        .frame(width: 100, height:  100)
                        .clipShape(.rect(cornerRadius: 10))
                        .overlay(
                            Image(systemName: "turkishlirasign")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(Color(lightGrey))
                                .padding()
                        )
                        .foregroundColor(darkGrey)
                    Rectangle()
                        .frame(width: 250, height: 100)
                        .cornerRadius(10)
                        .overlay(
                            TextField("Some", text: $upAmount, prompt: Text("Amount").foregroundStyle(grey))
                                .frame(width: 220, height: 90)
                                .background(darkGrey)
                                .multilineTextAlignment(.leading)
                                .clipShape(.rect(cornerRadius: 9))
                                .font(.system(size: 40, weight: .bold))
                                .foregroundStyle(.white)
                                .padding()
                        )
                        .foregroundColor(darkGrey)
                }
                HStack {
                    Rectangle()
                        .frame(width: 250, height: 100)
                        .cornerRadius(10)
                        .overlay(
                            TextField("", text: $upAmount, prompt: Text("Amount").foregroundStyle(grey))
                                .foregroundStyle(.white)
                                .frame(width: 220, height: 90)
                                .font(.system(size: 40, weight: .bold))
                                .background(darkGrey)
                                .multilineTextAlignment(.leading)
                                .clipShape(.rect(cornerRadius: 9))
                                .padding()
                        )
                        .foregroundColor(darkGrey)
                    Rectangle()
                        .frame(width: 100, height:  100)
                        .clipShape(.rect(cornerRadius: 10))
                        .overlay(
                            Image(systemName: "turkishlirasign")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(lightGrey)
                                .padding()
                        )
                        .foregroundColor(darkGrey)
                }
                Button (action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/){
                    Text("Convert")
                        .font(.title)
                }
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .background(green)
                .foregroundColor(background)
                .cornerRadius(10)
                Spacer()
                Spacer()
            }
            .foregroundStyle(Color(.white))
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
