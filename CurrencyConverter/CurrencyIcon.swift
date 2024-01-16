//
//  CurrencyIcon.swift
//  CurrencyConverter
//
//  Created by Berke Parıldar on 16.01.2024.
//

import SwiftUI

struct CurrencyIcon: View {
    let currencyImage: String
    let currencyName: String
    var body: some View {
        ZStack {
            Color(.darkGrey)
            VStack {
                Image(systemName: currencyImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                Text(currencyName)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
            }
            .foregroundStyle(Color(.foreground))
            .padding(10)
        }
        .frame(width: 100, height: 100)
        .clipShape(.rect(cornerRadius: 10))
    }
}

#Preview {
    CurrencyIcon(currencyImage: "turkishlirasign" , currencyName: "British Pound")
}
