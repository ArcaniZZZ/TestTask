//
//  Int + PriceConverter.swift
//  Effective_TestTask
//
//  Created by Arcani on 20.12.2022.
//

import Foundation

extension Int {
    
    /// Converts Int to String formatted as price
    func formatAsPrice(currencyCode: String) -> String {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = currencyCode
        formatter.currencyGroupingSeparator = ","
        formatter.maximumFractionDigits = 0

        let nsNumber = NSNumber(value: self)
        
        guard let formattedNumber = formatter.string(from: nsNumber) else {
            return ""
        }
        
        return formattedNumber
    }
    
}
