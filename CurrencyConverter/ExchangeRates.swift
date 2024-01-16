//
//  ExchangeRates.swift
//  CurrencyConverter
//
//  Created by Berke Parıldar on 17.01.2024.
//

import Foundation
struct ExchangeRates: Codable {
    let disclaimer: String
    let license: String
    let timestamp: TimeInterval
    let base: String
    let rates: [String: Double]
}
