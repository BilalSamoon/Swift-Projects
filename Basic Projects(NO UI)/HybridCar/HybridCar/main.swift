print("Name: Bilal Ahmed Samoon")
print("Student ID: 991714405")

class HybridCar {
    var make: String
    var model: String
    var year: Int
    var engineType: String
    var efficiencyIndex: Double
    
    init(make: String, model: String, year: Int, engineType: String, efficiencyIndex: Double) {
        self.make = make
        self.model = model
        self.year = year
        self.engineType = engineType
        self.efficiencyIndex = efficiencyIndex
    }
    
    func toString() -> String {
        return "Make: \(make)\nModel: \(model)\nYear: \(year)\nEngine Type: \(engineType)\nEfficiency Index: \(efficiencyIndex)"
    }
}

// Prompt the user for input
print("Please enter the make of the hybrid car:")
let make = readLine() ?? ""

print("Please enter the model of the hybrid car:")
let model = readLine() ?? ""

print("Please enter the year of the hybrid car:")
let yearInput = readLine() ?? ""
let year = Int(yearInput) ?? 0

print("Please enter the engine type of the hybrid car:")
let engineType = readLine() ?? ""

print("Please enter the efficiency index of the hybrid car (between 0 and 1):")
let efficiencyInput = readLine() ?? ""
let efficiencyIndex = Double(efficiencyInput) ?? 0.0

// Create an instance of HybridCar with user input
let hybridCar = HybridCar(make: make, model: model, year: year, engineType: engineType, efficiencyIndex: efficiencyIndex)

// Print the information using the toString() method
print(hybridCar.toString())
print("Very Satisfied with my purchase. The closest super charging station is still too far away !!!!")

