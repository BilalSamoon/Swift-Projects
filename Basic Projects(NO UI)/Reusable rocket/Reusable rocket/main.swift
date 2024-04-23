import Foundation


print("Name: Bilal Ahmed Samoon")
print("Student ID: 991714405")


struct ReusableRocket {
    let rocketName: String
    let height: Double
    let payloadCapacity: Double
    let numberOfReuses: Int
    
    func calculateMassFraction(deltaV: Double, ve: Double) -> Double {
        let massFraction = exp(-deltaV / ve)
        return massFraction
    }
    
    func toString() -> String {
        return """
        Rocket Name: \(rocketName)
        Height: \(height) meters
        Payload Capacity: \(payloadCapacity) lbs
        Number of Reuses: \(numberOfReuses)
        """
    }
}

func getRocketDataFromUser() -> ReusableRocket? {
    print("Please enter the following data:")
    
    print("Rocket Name: ")
    guard let rocketName = readLine(), !rocketName.isEmpty else {
        print("Invalid input. Rocket Name cannot be empty.")
        return nil
    }
    
    print("Rocket Height (meters): ")
    guard let heightStr = readLine(), let height = Double(heightStr) else {
        print("Invalid input. Please enter a valid height.")
        return nil
    }
    
    print("Rocket Payload Capacity (lbs): ")
    guard let payloadCapacityStr = readLine(), let payloadCapacity = Double(payloadCapacityStr) else {
        print("Invalid input. Please enter a valid payload capacity.")
        return nil
    }
    
    print("Number of Times This Rocket Has Been Launched Before: ")
    guard let numberOfReusesStr = readLine(), let numberOfReuses = Int(numberOfReusesStr) else {
        print("Invalid input. Please enter a valid number of reuses.")
        return nil
    }
    
    let rocket = ReusableRocket(rocketName: rocketName, height: height, payloadCapacity: payloadCapacity, numberOfReuses: numberOfReuses)
    return rocket
}

if let rocket = getRocketDataFromUser() {
    print(rocket.toString())
    
    print("Enter the initial mass of the rocket at launch or take-off, including rocket fuel (M0 in tons): ")
    guard let initialMassStr = readLine(), let initialMass = Double(initialMassStr) else {
        print("Invalid input. Please enter a valid initial mass.")
        exit(0)
    }
    
    print("Enter the final mass of the rocket once it reaches orbit (M1 in tons): ")
    guard let finalMassStr = readLine(), let finalMass = Double(finalMassStr) else {
        print("Invalid input. Please enter a valid final mass.")
        exit(0)
    }
    
    print("Enter the value for delta V, which represents the change in rocket velocity to achieve Low Earth Orbit (LEO): ")
    guard let deltaVStr = readLine(), let deltaV = Double(deltaVStr) else {
        print("Invalid input. Please enter a valid delta V.")
        exit(0)
    }
    
    print("Enter the rocket ejection velocity (Ve in km/s): ")
    guard let veStr = readLine(), let ve = Double(veStr) else {
        print("Invalid input. Please enter a valid ejection velocity.")
        exit(0)
    }
    
    let massFraction = rocket.calculateMassFraction(deltaV: deltaV, ve: ve)
    print("The calculated mass fraction of this launch is: \(massFraction)")
    print("Wow!!! Another successful launch. Bringing Space to everyone's backyard.")
} else {
    print("Invalid input. Please try again.")
}
