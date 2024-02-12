//
//  CurrencyManager.swift
//  CurrencyConverter
//
//  Created by Berke Parıldar on 16.01.2024.
//

import Foundation

class CurrencyManager: ObservableObject {
    static var currencies: [Currency] = [
        Currency(name: "US Dollar", code: "USD", imageName: "dollarsign", value: 1),
        Currency(name: "Euro", code: "EUR", imageName: "eurosign", value: 1),
        Currency(name: "Japanese Yen", code: "JPY", imageName: "yensign", value: 1),
        Currency(name: "British Pound", code: "GBP", imageName: "sterlingsign", value: 1),
        Currency(name: "Swiss Franc", code: "CHF", imageName: "francsign", value: 1),
        Currency(name: "Turkish Lira", code: "TRY", imageName: "turkishlirasign", value: 1),
        Currency(name: "Korean Won", code: "KRW", imageName: "wonsign", value: 1),
        Currency(name: "Australian Dollar", code: "AUD", imageName: "australiandollarsign", value: 1),
        Currency(name: "Russian Ruble", code: "RUB", imageName: "rublesign", value: 1),
        Currency(name: "Polish Zloty", code: "PLN", imageName: "polishzlotysign", value: 1),
        Currency(name: "Chinese Yuan", code: "CNY", imageName: "chineseyuanrenminbisign", value: 1),
        Currency(name: "Swedish Krona", code: "SEK", imageName: "swedishkronasign", value: 1),
    ]
    
    static func fetchExchangeRates(completion: @escaping (Result<Void, Error>) -> Void) {
        guard let url = URL(string: "http://api.exchangeratesapi.io/v1/latest?access_key=15b579b9f330be5031380fe062defcb5&symbols=USD,TRY,EUR,AUD,SEK,JPY,CNY,RUB,KRW,CHF,PLN&format=1") else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NSError(domain: "No data received", code: 1, userInfo: nil)))
                return
            }
            print(String(data: data, encoding: .utf8) ?? "Data is not in UTF-8 format")
            do {
                let decoder = JSONDecoder()
                let exchangeRates = try decoder.decode(ExchangeRates.self, from: data)
                
                DispatchQueue.main.async {
                    updateCurrencies(with: exchangeRates)
                    completion(.success(()))
                }
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
    
    private static func updateCurrencies(with exchangeRates: ExchangeRates) {
        for (code, rate) in exchangeRates.rates {
            if let index = currencies.firstIndex(where: { $0.code == code }) {
                currencies[index].value = rate
            }
        }
    }
}
