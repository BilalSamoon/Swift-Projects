//Bilal Ahmed Samoon
//991714405
import Foundation

print("Name: Bilal Ahmed Samoon")
print("Student ID: 991714405")

class RectangularCube {
    let id: String
    var width: Int
    var height: Int
    var depth: Int
    
    init(id: String, width: Int, height: Int, depth: Int) {
        self.id = id
        self.width = width
        self.height = height
        self.depth = depth
    }
    
    func calculateVolume() -> Int {
        return width * height * depth
    }
    
    func toString() -> String {
        let volume = calculateVolume()
        return "ID: \(id)\nWidth: \(width) meters\nHeight: \(height) meters\nDepth: \(depth) meters\nVolume: \(volume) cubic meters"
    }
}

// Prompt user for input
func promptForInput() -> RectangularCube? {
    print("Enter the ID for the Rectangular Cube: ")
    guard let id = readLine(), !id.isEmpty else {
        print("Invalid input. ID cannot be empty.")
        return nil
    }
    
    print("Enter the width (1-20): ")
    guard let widthStr = readLine(), let width = Int(widthStr), (1...20).contains(width) else {
        print("Invalid input. Please enter a valid width between 1 and 20.")
        return nil
    }
    
    print("Enter the height (1-20): ")
    guard let heightStr = readLine(), let height = Int(heightStr), (1...20).contains(height) else {
        print("Invalid input. Please enter a valid height between 1 and 20.")
        return nil
    }
    
    print("Enter the depth (1-20): ")
    guard let depthStr = readLine(), let depth = Int(depthStr), (1...20).contains(depth) else {
        print("Invalid input. Please enter a valid depth between 1 and 20.")
        return nil
    }
    
    return RectangularCube(id: id, width: width, height: height, depth: depth)
}

// Create a dictionary to store Rectangular Cube objects
var cubeDictionary: [String: RectangularCube] = [:]

// Store at least 3 sets of values
for _ in 1...3 {
    if let cube = promptForInput() {
        cubeDictionary[cube.id] = cube
    } else {
        print("Invalid input. Skipping this cube.")
    }
}

// Print the details of the stored cubes
for cube in cubeDictionary.values {
    print(cube.toString())
    print("------------")
}
