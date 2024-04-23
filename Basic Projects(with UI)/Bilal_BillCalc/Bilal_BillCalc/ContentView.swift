//
//  ContentView.swift
//  Bilal_BillCalc
//
//  Created by BilalSamoon on 2023-08-01.
//

import SwiftUI

struct ContentView: View {
    // Define properties for user input
    @State private var onPeakUsage: String = ""
    @State private var offPeakUsage: String = ""
    @State private var midPeakUsage: String = ""
    
    // Define computed properties for calculated values
    private var onPeakCharge: Double {
        // Implement calculation for on-peak charge
        // Charge: $0.132 per kWh
        if let onPeakUsageValue = Double(onPeakUsage) {
            return 0.132 * onPeakUsageValue
        }
        return 0.0
    }
    
    private var offPeakCharge: Double {
        // Implement calculation for off-peak charge
        // Charge: $0.065 per kWh
        if let offPeakUsageValue = Double(offPeakUsage) {
            return 0.065 * offPeakUsageValue
        }
        return 0.0
    }
    
    private var midPeakCharge: Double {
        // Implement calculation for mid-peak charge
        // Charge: $0.094 per kWh
        if let midPeakUsageValue = Double(midPeakUsage) {
            return 0.094 * midPeakUsageValue
        }
        return 0.0
    }
    
    private var totalConsumptionCharges: Double {
        // Implement calculation for total consumption charges
        return onPeakCharge + offPeakCharge + midPeakCharge
    }
    
    private var hstCharge: Double {
        // Implement calculation for HST charge
        // HST is 13% of the total consumption charges
        return 0.13 * totalConsumptionCharges
    }
    
    private var provincialRebate: Double {
        // Implement calculation for provincial rebate
        // Provincial rebate(discount) is 8% of the total consumption charges
        return 0.08 * totalConsumptionCharges
    }
    
    private var totalRegulatoryCharges: Double {
        // Implement calculation for total regulatory charges
        // Total regulatory charges are HST – provincial rebate
        return hstCharge - provincialRebate
    }
    
    private var actualBillAmount: Double {
        // Implement calculation for actual bill amount
        // Actual bill amount is total consumption charges + total regulatory charges
        return totalConsumptionCharges + totalRegulatoryCharges
    }
    
    var body: some View {
            NavigationView {
                Form {
                    Section(header: Text("Hydro Consumption (kWh)").foregroundColor(Color("Primary Text"))) {
                        TextField("On-Peak Usage", text: $onPeakUsage)
                            .keyboardType(.decimalPad)
                            .foregroundColor(Color("Primary Text"))
                        TextField("Off-Peak Usage", text: $offPeakUsage)
                            .keyboardType(.decimalPad)
                            .foregroundColor(Color("Primary Text"))
                        TextField("Mid-Peak Usage", text: $midPeakUsage)
                            .keyboardType(.decimalPad)
                            .foregroundColor(Color("Primary Text"))
                    }
                    
                    Section(header: Text("Consumption Charges").foregroundColor(Color("Secondary Text"))) {
                        Text("On-Peak Charge: $\(onPeakCharge, specifier: "%.2f")")
                            .foregroundColor(Color("Blue Accent"))
                        Text("Off-Peak Charge: $\(offPeakCharge, specifier: "%.2f")")
                            .foregroundColor(Color("Blue Accent"))
                        Text("Mid-Peak Charge: $\(midPeakCharge, specifier: "%.2f")")
                            .foregroundColor(Color("Blue Accent"))
                        Text("Total Consumption Charges: $\(totalConsumptionCharges, specifier: "%.2f")")
                            .foregroundColor(Color("Action Colors"))
                    }
                    
                    Section(header: Text("Regulatory Charges").foregroundColor(Color("Secondary Text"))) {
                        Text("HST (13%): $\(hstCharge, specifier: "%.2f")")
                            .foregroundColor(Color("Blue Accent"))
                        Text("Provincial Rebate (8%): $\(provincialRebate, specifier: "%.2f")")
                            .foregroundColor(Color("Blue Accent"))
                        Text("Total Regulatory Charges: $\(totalRegulatoryCharges, specifier: "%.2f")")
                            .foregroundColor(Color("Action Colors"))
                    }
                    
                    Section(header: Text("Bill Amount").foregroundColor(Color("Secondary Text"))) {
                        Text("Net Bill Amount: $\(actualBillAmount, specifier: "%.2f")")
                            .foregroundColor(Color("Red Accent"))
                    }
                }
                .background(Color("Background").edgesIgnoringSafeArea(.all))
                .navigationBarTitle(Text("Bilal Samoon").foregroundColor(Color("Primary Text")))
            }
        }
    }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            Group {
                ContentView()
                    .preferredColorScheme(.light)
                ContentView()
                    .preferredColorScheme(.dark)
            }
        }
    }
