//
//  CurrencyTip.swift
//  CurrencyConverter
//
//  Created by Berke Parıldar on 17.01.2024.
//

import Foundation
import TipKit

struct CurrencyTip: Tip {
    var title: Text = Text("Change Currency")
    var message: Text? = Text("You can tap on the currency icon to change currencies.")
}
