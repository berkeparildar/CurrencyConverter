//
//  ContentView.swift
//  CurrencyConverter
//
//  Created by Berke Parıldar on 16.01.2024.
//

import SwiftUI
import TipKit

struct ContentView: View {
    @State var upAmount: String = ""
    @State var downAmount: String = "Result"
    @State var selectedUpperCurrency: Bool = false
    @State var selectedLowerCurrency: Bool = false
    @State var upperCurrency: Currency = CurrencyManager.currencies[0]
    @State var lowerCurrency: Currency = CurrencyManager.currencies[1]
    @FocusState var typing: Bool
    
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
                                .padding(20)
                                .popoverTip(CurrencyTip(), arrowEdge: .bottom)

                        )
                        .foregroundColor(.darkGrey)
                        .onTapGesture {
                            typing = false
                            selectedUpperCurrency.toggle()
                        }
                        .onChange(of: upperCurrency) {
                            downAmount = upperCurrency.convert(to: lowerCurrency, upAmount)
                        }
                    Rectangle()
                        .frame(width: 250, height: 100)
                        .cornerRadius(10)
                        .overlay(
                            TextField("Some", text: $upAmount, prompt: Text("Amount").foregroundStyle(.grey))
                                .keyboardType(.decimalPad)
                                .frame(width: 220, height: 90)
                                .background(Color(.darkGrey))
                                .multilineTextAlignment(.center)
                                .clipShape(.rect(cornerRadius: 9))
                                .font(.system(size: 40, weight: .bold))
                                .foregroundStyle(Color(.foreground))
                                .padding()
                                .focused($typing)
                                .onChange(of:upAmount) {
                                    if typing {
                                        downAmount = upperCurrency.convert(to: lowerCurrency, upAmount)
                                    }
                                }
                        )
                        .foregroundColor(.darkGrey)
                }
                HStack {
                    Rectangle()
                        .frame(width: 250, height: 100)
                        .cornerRadius(10)
                        .overlay(
                            Text(downAmount).foregroundStyle(Color(.grey))
                                .multilineTextAlignment(.leading)
                                .foregroundStyle(.white)
                                .font(.system(size: 40, weight: .bold))
                                .background(.darkGrey)
                                .clipShape(.rect(cornerRadius: 9))
                                .frame(width: 220, height: 90)
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
                                .padding(20)
                        )
                        .foregroundColor(Color(.darkGrey))
                        .onTapGesture {
                            selectedLowerCurrency.toggle()
                            typing = false
                        }
                        .onChange(of: lowerCurrency) {
                            downAmount = upperCurrency.convert(to: lowerCurrency, upAmount)
                        }
                }
                Spacer()
                Spacer()
            }
            .task {
                try? Tips.configure()
            }
            .foregroundStyle(Color(.white))
            .padding()
            .sheet(isPresented: $selectedUpperCurrency, content: {
                CurrencySelect(selectedCurrency: $upperCurrency)
            })
            .sheet(isPresented: $selectedLowerCurrency, content: {
                CurrencySelect(selectedCurrency: $lowerCurrency)
            })
            .onAppear {
                fetchExchangeRates(self: self)
            }
        }
    }
}

private func fetchExchangeRates(self: ContentView) {
    CurrencyManager.fetchExchangeRates { result in
        switch result {
        case .success:
            print("Exchange rates fetched successfully.")
            self.upperCurrency = CurrencyManager.currencies[0]
            self.lowerCurrency = CurrencyManager.currencies[1]
            
            // You can update your UI or perform additional actions on success.
        case .failure(let error):
            print("Failed to fetch exchange rates: \(error.localizedDescription)")
            // Handle the error, show an alert, or perform other error-handling actions.
        }
    }
}

#Preview {
    ContentView()
}
