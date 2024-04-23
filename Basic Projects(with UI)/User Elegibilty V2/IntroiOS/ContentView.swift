//
//  ContentView.swift
//  IntroiOS
//
//  Created by Bilal Samoon on 2023-07-20.
//

import SwiftUI

struct ContentView: View {
    
    //to receive input from TextField for user name
    
    //State property wrapper
    @State private var tfName : String = ""
    @State private var tfAge : String = ""
    
    @State private var genderIndex : Int = 3
    private let genderOptions = ["Male", "Female", "LGBTQ2IS+", "No Disclosure"]
    
    @State private var packageIndex : Int = 1
    private let packageOptions = ["Free Trial", "Basic", "Premium"]
    private let packagePrice = [0, 50.0, 100.0]
    
    private var eligibility : Bool {
//        var numericAge = Int(tfAge) ?? 0
//
//        if ( numericAge >= 18){
//            return true
//        }
//
//        return false
        
        return ( (Int(self.tfAge) ?? 0 ) >= 18 )
    }
    
    private var packageAmount : Double{
        //check if age is more or equal to 60, apply 20% discount of package price
        
        var amount = self.packagePrice[self.packageIndex]
        
        if ( (Int(self.tfAge) ?? 0) >= 60 ){
            amount -= (amount * 0.20)
        }
        
        return amount
    }
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {

            
            Text("User Registration")
                .foregroundColor(Color.brown)
                .font(.title)
                .bold()
            
            Form{
                
                //to receive input from user
                TextField("Enter Name", text: self.$tfName)
               
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.words)
                    .keyboardType(.namePhonePad)
                
                TextField("Enter Age", text: self.$tfAge)
              
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.words)
                    .keyboardType(.numberPad)
                
                Picker("Gender : ", selection: self.$genderIndex){
                    
                    ForEach(0..<self.genderOptions.count){
                        Text("\(self.genderOptions[$0])")
                    }
                    
                }
                
                Section(header: Text("Package")){
                    Picker("Package : ", selection: self.$packageIndex){
                        
                        ForEach(0..<self.packageOptions.count){
                            Text("\(self.packageOptions[$0])")
                        }
                    }//Picker ends
                    .pickerStyle(SegmentedPickerStyle())
                }//Section
                
                
                Section(header: Text("Profile Information")){
                    
                    Text("Name of user : \(self.tfName)")
                        .bold()
                        .font(.title2)
                    
                    Text("Age : \(self.tfAge)")
                        .bold()
                        .font(.title2)
                    
                    Text("Gender : \(self.genderOptions[self.genderIndex])")
                        .bold()
                        .font(.title2)
                }
                
                Section(header: Text("Account Information")){
                    //ctrl + cmd + space to get the emoji pallete
                    Text("Eligibility : \( self.eligibility ? "Approved ✅" : "Rejected ❌" )")
                        .bold()
                        .font(.title2)
                    

                    
                    Text("Subscription Amount : $ \(self.packageAmount, specifier: "%.2f")")
                        .bold()
                        .font(.title2)
                }
                
            }//Form ends
            
            Spacer()
        }//VStack
        .padding()
//        .background(Color.yellow)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
