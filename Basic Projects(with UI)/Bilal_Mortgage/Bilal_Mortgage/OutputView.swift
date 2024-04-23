//
//  OutputView.swift
//  Bilal_Mortgage
//
//  Created by BilalSamoon on 2023-08-17.
//

import SwiftUI

struct OutputView: View {
    // The mortgageAmounts array will store the monthly mortgage values
    var mortgageAmounts: [Double]

    var body: some View {
        VStack {
            Text("Calculated Mortgage Amounts")
                .font(.title)
                .padding()

            List {
                ForEach(mortgageAmounts, id: \.self) { amount in
                    Text("$\(amount, specifier: "%.2f")")
                }
            }
        }
    }
}

struct OutputView_Previews: PreviewProvider {
    static var previews: some View {
        OutputView(mortgageAmounts: [1000.0, 1100.5, 1050.75])
    }
}
