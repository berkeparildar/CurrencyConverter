//
//  Currency.swift
//  CurrencyConverter
//
//  Created by Berke Parıldar on 16.01.2024.
//

import Foundation

public struct Currency {
    
    var name: String
    var code: String
    var imageName: String
    var value: Double?
    
    init(name: String, code: String, imageName: String, value: Double? = nil) {
        self.name = name
        self.code = code
        self.imageName = imageName
        self.value = value
    }
}
