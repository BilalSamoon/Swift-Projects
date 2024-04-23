//
//  Mortgage.swift
//  Bilal_Mortgage
//
//  Created by BilalSamoon on 2023-08-17.
//

import Foundation

class Mortgage {

    func calculateMortgageAmount(for housePrice: Double, downPayment: Double, interestRate: Double, termInYears: Int) -> Double {
        
        let P = housePrice - downPayment
        let R = interestRate / 100 / 12
        let N = Double(termInYears) * 12
        
        // Mortgage payment formula
        let mortgageAmount = P * ((R * pow(1 + R, N)) / (pow(1 + R, N) - 1))
        
        return mortgageAmount
    }
    
    func calculateDownPayment(for housePrice: Double, downPaymentPercentage: Double) -> Double {
        return housePrice * downPaymentPercentage / 100.0
    }
}
