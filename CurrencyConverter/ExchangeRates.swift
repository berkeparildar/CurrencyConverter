//
//  ExchangeRates.swift
//  CurrencyConverter
//
//  Created by Berke Parıldar on 17.01.2024.
//

import Foundation
struct ExchangeRates: Codable {
    let success: Bool
    let timestamp: TimeInterval
    let base: String
    let date: String
    let rates: [String: Double]
}
