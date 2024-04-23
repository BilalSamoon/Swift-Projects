import Foundation

print("Name: Bilal Ahmed Samoon")
print("Student ID: 991714405")

class SolarEnergyHomeHeating {
    let homeStyle: String
    var homeSize: Double
    var sunlightIndex: Double
    let homeFacing: String
    let solarHeatingType: String
    var solarPanelWattage: Double
    
    init(homeStyle: String, homeSize: Double, sunlightIndex: Double, homeFacing: String, solarHeatingType: String, solarPanelWattage: Double) {
        self.homeStyle = homeStyle
        self.homeSize = homeSize
        self.sunlightIndex = sunlightIndex
        self.homeFacing = homeFacing
        self.solarHeatingType = solarHeatingType
        self.solarPanelWattage = solarPanelWattage
    }
    
    func calculateSolarPanels() -> Int {
        let hourlyEnergy = 10700.0 // kWh per year
        let peakSunlightHours = 4.0 // hours per day (assumption)
        
        let solarPanels = Int(hourlyEnergy * peakSunlightHours / solarPanelWattage)
        return solarPanels
    }
    
    func toString() -> String {
        return """
        Home Style: \(homeStyle)
        Home Size: \(homeSize) sq. ft.
        Sunlight Index: \(sunlightIndex)
        Home Facing: \(homeFacing)
        Solar Heating Type: \(solarHeatingType)
        Solar Panel Wattage: \(solarPanelWattage) W
        
        Calculated Solar Panels: \(calculateSolarPanels())
        """
    }
}

func promptForInput() -> SolarEnergyHomeHeating? {
    print("Enter Home Style:")
    guard let homeStyle = readLine(), !homeStyle.isEmpty else {
        print("Invalid input. Please enter a Home Style.")
        return nil
    }
    
    print("Enter Home Size (square feet):")
    guard let homeSizeStr = readLine(), let homeSize = Double(homeSizeStr), homeSize >= 1.0 && homeSize <= 20.0 else {
        print("Invalid input. Please enter a valid Home Size between 1 and 20 square feet.")
        return nil
    }
    
    print("Enter Sunlight Index:")
    guard let sunlightIndexStr = readLine(), let sunlightIndex = Double(sunlightIndexStr), sunlightIndex >= 0.0 && sunlightIndex <= 1.0 else {
        print("Invalid input. Please enter a valid Sunlight Index between 0 and 1.")
        return nil
    }
    
    print("Enter Home Facing Cardinal Direction:")
    guard let homeFacing = readLine(), !homeFacing.isEmpty else {
        print("Invalid input. Please enter a Home Facing Cardinal Direction.")
        return nil
    }
    
    print("Enter Solar Heating Type:")
    guard let solarHeatingType = readLine(), !solarHeatingType.isEmpty else {
        print("Invalid input. Please enter a Solar Heating Type.")
        return nil
    }
    
    print("Enter Solar Panel Wattage (between 150W and 370W):")
    guard let solarPanelWattageStr = readLine(), let solarPanelWattage = Double(solarPanelWattageStr), (150...370).contains(solarPanelWattage) else {
        print("Invalid input. Please enter a valid Solar Panel Wattage between 150 and 370 W.")
        return nil
    }
    
    return SolarEnergyHomeHeating(homeStyle: homeStyle, homeSize: homeSize, sunlightIndex: sunlightIndex, homeFacing: homeFacing, solarHeatingType: solarHeatingType, solarPanelWattage: solarPanelWattage)
}

if let solarEnergyHomeHeating = promptForInput() {
    print("\nDoing my part to save the planet and home efficiency !!!!")
    print(solarEnergyHomeHeating.toString())
}
