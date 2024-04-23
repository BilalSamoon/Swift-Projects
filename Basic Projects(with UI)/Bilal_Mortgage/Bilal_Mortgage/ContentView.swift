import SwiftUI

struct ContentView: View {
    //
    @State private var housePrice: String = ""
    @State private var interestRate: String = ""
    @State private var selectedTerm: Int = 0
    @State private var selectedDownPayment: Int = 0

    // Available mortgage terms for the user to choose from.
        let terms = [5, 10, 15, 20, 25, 30]
        // Available down payment percentages for the user to choose from.
        let downPayments = [5, 10, 15, 20]

        // Computed property to calculate the down payment amount.
        var downPaymentAmount: Double {
            (Double(housePrice) ?? 0.0) * Double(downPayments[selectedDownPayment]) / 100.0
        }

        // State to store the calculated monthly mortgage amount.
        @State private var currentMortgageAmount: Double = 0.0

        let mortgageCalculator = Mortgage()

        // function to calculate the monthly mortgage payment.
    func calculateMortgage() {
        let housePriceValue = Double(housePrice) ?? 0.0
        let downPayment = mortgageCalculator.calculateDownPayment(for: housePriceValue, downPaymentPercentage: Double(downPayments[selectedDownPayment]))
        let interestRateValue = Double(interestRate) ?? 0.0
        let termInYears = terms[selectedTerm]
        
        currentMortgageAmount = mortgageCalculator.calculateMortgageAmount(for: housePriceValue, downPayment: downPayment, interestRate: interestRateValue, termInYears: termInYears)
    }

        
        var body: some View {
            NavigationView {
                Form {
                    // House price input section
                    Section(header: Text("Enter House Price")) {
                        TextField("House Price", text: $housePrice)
                            .keyboardType(.decimalPad)
                    }
                    
                    // Mortgage term selection section
                    Section(header: Text("Select Mortgage Term")) {
                        Picker("Mortgage Term (Years)", selection: $selectedTerm) {
                            ForEach(0..<terms.count) { index in
                                Text("\(self.terms[index])yr").tag(index)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    
                    // Interest rate input section
                    Section(header: Text("Enter Mortgage Rate")) {
                        TextField("Yearly Mortgage Interest Rate (%)", text: $interestRate)
                            .keyboardType(.decimalPad)
                    }
                    
                    // Down payment selection section
                    Section(header: Text("Choose Down Payment")) {
                        Picker("Down Payment (%)", selection: $selectedDownPayment) {
                            ForEach(0..<downPayments.count) { index in
                                Text("\(self.downPayments[index])%").tag(index)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    
                    // Calculate button section
                    Section {
                        Button(action: {
                            self.calculateMortgage()
                        }, label: {
                            Text("Calculate")
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        })
                    }

                    // Results section
                    Section(header: Text("Results")) {
                        Text("Down Payment Amount: $\(downPaymentAmount, specifier: "%.2f")")
                        Text("Monthly Mortgage Amount: $\(currentMortgageAmount, specifier: "%.2f")")
                            .fontWeight(.bold)
                            .foregroundColor(.green)
                    }
                }
                .navigationBarTitle("Bilal_Mortgage")
            }
        }
    }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
