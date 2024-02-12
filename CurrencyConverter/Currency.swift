//
//  Currency.swift
//  CurrencyConverter
//
//  Created by Berke Parıldar on 16.01.2024.
//

import Foundation

public struct Currency: Equatable {
    
    var name: String
    var code: String
    var imageName: String
    var value: Double?
    
    init(name: String, code: String, imageName: String, value: Double) {
        self.name = name
        self.code = code
        self.imageName = imageName
        self.value = value
    }
    
    func convert(to targetCurrency: Currency, _ amountString: String) -> String {
        let formattedAmountString = amountString.replacingOccurrences(of: ",", with: ".")
        guard let doubleAmount = Double(formattedAmountString) else { return "Result" }
        guard let myValue = self.value else {return "Result"}
        guard let targetValue = targetCurrency.value else {return "Result"}
        let exchangeRate = targetValue / myValue
        let convertedAmount = String(format: "%.2f", exchangeRate * doubleAmount)
        return convertedAmount
    }
}
