//
//  CurrencyManager.swift
//  CurrencyConverter
//
//  Created by Berke Parıldar on 16.01.2024.
//

import Foundation

class CurrencyManager: ObservableObject {
    static var currencies: [Currency] = [
        Currency(name: "US Dollar", code: "USD", imageName: "dollarsign"),
        Currency(name: "Euro", code: "EUR", imageName: "eurosign"),
        Currency(name: "Japanese Yen", code: "JPY", imageName: "yensign"),
        Currency(name: "British Pound", code: "GBP", imageName: "sterlingsign"),
        Currency(name: "Swiss Franc", code: "CHF", imageName: "francsign"),
        Currency(name: "Turkish Lira", code: "TRY", imageName: "turkishlirasign"),
        Currency(name: "Korean Won", code: "KRW", imageName: "wonsign"),
        Currency(name: "Australian Dollar", code: "AUD", imageName: "australiandollarsign"),
        Currency(name: "Russian Ruble", code: "RUB", imageName: "rublesign"),
        Currency(name: "Polish Zloty", code: "PLN", imageName: "polishzlotysign"),
        Currency(name: "Chinese Yuan", code: "CNY", imageName: "chineseyuanrenminbisign"),
        Currency(name: "Swedish Krona", code: "SEK", imageName: "swedishkronasign"),
    ]
    
    
}
