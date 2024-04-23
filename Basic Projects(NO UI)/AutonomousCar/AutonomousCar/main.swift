print("Name: Bilal Ahmed Samoon")
print("Student ID: 991714405")



class AutonomousCar {
    var make: String
    var model: String
    var year: Int
    var ai: String
    var autopilot: Bool
    var fsd: Int
    
    init(make: String, model: String, year: Int, ai: String, autopilot: Bool, fsd: Int) {
        self.make = make
        self.model = model
        self.year = year
        self.ai = ai
        self.autopilot = autopilot
        self.fsd = fsd
    }
    
    func toString() -> String {
        return "Make: \(make)\nModel: \(model)\nYear: \(year)\nAI: \(ai)\nAutopilot: \(autopilot ? "Yes" : "No")\nFSD: \(fsd)"
    }
}

// Prompt the user for input
print("Please enter the model of the autonomous car:")
let model = readLine() ?? ""

print("Please enter the year of the autonomous car:")
let yearInput = readLine() ?? ""
let year = Int(yearInput) ?? 0

print("Please enter the AI assistant of the autonomous car (Siri, Alexa, Cortana, Echo):")
let ai = readLine() ?? ""

print("Please enter whether the car has autopilot (yes/no):")
let autopilotInput = readLine()?.lowercased()
let autopilot = autopilotInput == "yes"

print("Please enter the FSD version of the autonomous car (9 to 12):")
let fsdInput = readLine() ?? ""
let fsd = Int(fsdInput) ?? 0

// Create an instance of AutonomousCar with user input
let autonomousCar = AutonomousCar(make: "Tesla", model: model, year: year, ai: ai, autopilot: autopilot, fsd: fsd)

// Print the information using the toString() method
print(autonomousCar.toString())
print("Improving everyday with more than 97% accuracy !!! Keep going, can’t wait for my RoboTaxi !!!")
