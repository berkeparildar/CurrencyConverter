//
//  ContentView.swift
//  CurrencyConverter
//
//  Created by Berke Parıldar on 16.01.2024.
//

import SwiftUI

struct ContentView: View {
    @State var upAmount: String = ""
    @State var downAmount: String = ""
    @State var selectedUpperCurrency: Bool = false
    @State var selectedLowerCurrency: Bool = false
    @State var upperCurrency: Currency = CurrencyManager.currencies[0]
    @State var lowerCurrency: Currency = CurrencyManager.currencies[1]
    
    var body: some View {
        ZStack {
            Color(.background).edgesIgnoringSafeArea(.all)
            VStack {
                VStack {
                    Text("Currency Converter")
                        .font(.largeTitle)
                    Image(systemName: "coloncurrencysign.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                }
                .foregroundStyle(Color(.foreground))
                .padding()
                Spacer()
                HStack {
                    Rectangle()
                        .frame(width: 100, height:  100)
                        .clipShape(.rect(cornerRadius: 10))
                        .overlay(
                            Image(systemName: upperCurrency.imageName)
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.foreground)
                                .padding()
                        )
                        .foregroundColor(.darkGrey)
                        .onTapGesture {
                            selectedUpperCurrency.toggle()
                        }
                    Rectangle()
                        .frame(width: 250, height: 100)
                        .cornerRadius(10)
                        .overlay(
                            TextField("Some", text: $upAmount, prompt: Text("Amount").foregroundStyle(.grey))
                                .frame(width: 220, height: 90)
                                .background(Color(.darkGrey))
                                .multilineTextAlignment(.leading)
                                .clipShape(.rect(cornerRadius: 9))
                                .font(.system(size: 40, weight: .bold))
                                .foregroundStyle(.white)
                                .padding()
                        )
                        .foregroundColor(.darkGrey)
                }
                HStack {
                    Rectangle()
                        .frame(width: 250, height: 100)
                        .cornerRadius(10)
                        .overlay(
                            TextField("", text: $downAmount, prompt: Text("Amount").foregroundStyle(Color(.grey)))
                                .foregroundStyle(.white)
                                .frame(width: 220, height: 90)
                                .font(.system(size: 40, weight: .bold))
                                .background(.darkGrey)
                                .multilineTextAlignment(.leading)
                                .clipShape(.rect(cornerRadius: 9))
                                .padding()
                        )
                        .foregroundColor(.darkGrey)
                    Rectangle()
                        .frame(width: 100, height:  100)
                        .clipShape(.rect(cornerRadius: 10))
                        .overlay(
                            Image(systemName: lowerCurrency.imageName)
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.foreground)
                                .padding()
                        )
                        .foregroundColor(Color(.darkGrey))
                        .onTapGesture {
                            selectedLowerCurrency.toggle()
                        }
                }
                Button (action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/){
                    Text("Convert")
                        .font(.title)
                }
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .background(.myGreen)
                .foregroundColor(Color(.background))
                .cornerRadius(10)
                Spacer()
                Spacer()
            }
            .foregroundStyle(Color(.white))
            .padding()
            .sheet(isPresented: $selectedUpperCurrency, content: {
                CurrencySelect(selectedCurrency: $upperCurrency)
            })
            .sheet(isPresented: $selectedLowerCurrency, content: {
                CurrencySelect(selectedCurrency: $lowerCurrency)
            })
        }
    }
}

#Preview {
    ContentView()
}
