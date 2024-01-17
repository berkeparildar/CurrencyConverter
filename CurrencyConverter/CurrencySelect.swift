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
    @Environment (\.dismiss) var dismiss
    var body: some View {
        ZStack {
            Color(.background).ignoresSafeArea()
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundStyle(Color(.foreground))
                    })
                }
                Text("Select a currency")
                    .foregroundStyle(Color(.foreground))
                    .font(.largeTitle)
                    .padding()
                Spacer()
                Grid {
                    CurrencyGridRow(indices: 0..<3, currencies: currencies, selectedCurrency: $selectedCurrency)
                    CurrencyGridRow(indices: 3..<6, currencies: currencies, selectedCurrency: $selectedCurrency)
                    CurrencyGridRow(indices: 6..<9, currencies: currencies, selectedCurrency: $selectedCurrency)
                    CurrencyGridRow(indices: 9..<12, currencies: currencies, selectedCurrency: $selectedCurrency)
                }
                Button (action: {
                    dismiss()
                }){
                    Text("Done")
                        .font(.title)
                }
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .background(.myGreen)
                .foregroundColor(Color(.background))
                .cornerRadius(10)
                .padding()
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    CurrencySelect(selectedCurrency: .constant(Currency(name: "US Dollar", code: "USD", imageName: "dollarsign", value: 1)))
}

struct CurrencyGridRow: View {
    var indices: Range<Int>
    var currencies: [Currency]
    @Binding var selectedCurrency: Currency
    var body: some View {
        GridRow {
            ForEach(indices, id: \.self) { index in
                if selectedCurrency.code == currencies[index].code {
                    CurrencyIcon(
                        currencyImage: currencies[index].imageName,
                        currencyName: currencies[index].name
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
                    CurrencyIcon(currencyImage: currencies[index].imageName,
                                 currencyName: currencies[index].name)
                    .onTapGesture {
                        selectedCurrency = currencies[index]
                    }
                }
            }
        }
    }
}
