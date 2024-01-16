//
//  CurrencySelect.swift
//  CurrencyConverter
//
//  Created by Berke Parıldar on 16.01.2024.
//

import SwiftUI

struct CurrencySelect: View {
    var currencies :[Currency] = CurrencyManager.currencies
    @Binding var selectedCurrency: Currency
    var body: some View {
        ZStack {
            Color(.background).ignoresSafeArea()
            VStack {
                Text("Select a currency")
                    .foregroundStyle(Color(.foreground))
                    .font(.largeTitle)
                    .padding()
                Spacer()
                LazyVGrid(columns: [
                    GridItem(.flexible(), spacing: 0),
                    GridItem(.flexible(), spacing: 0),
                    GridItem(.flexible(), spacing: 0),
                    ], spacing: 20) {
                    ForEach(currencies, id: \.code) { currency in
                        if selectedCurrency.code == currency.code {
                            CurrencyIcon(
                                currencyImage: currency.imageName,
                                currencyName: currency.name
                            )
                            .shadow( color: .myGreen, radius: 4)
                            .overlay {
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(lineWidth: 3)
                                    .foregroundStyle(.myGreen)
                                    .opacity(0.5)
                            }
                        }
                        else {
                            CurrencyIcon(
                                currencyImage: currency.imageName,
                                currencyName: currency.name
                            )
                            .onTapGesture {
                                self.selectedCurrency = currency
                            }
                        }
                    }.scaleEffect(1.1)
                }
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    CurrencySelect(selectedCurrency: .constant(Currency(name: "US Dollar", code: "USD", imageName: "dollarsign")))
}
