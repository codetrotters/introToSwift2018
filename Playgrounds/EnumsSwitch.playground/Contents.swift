import UIKit

// Value and Reference Types




// an enum encapsulates all possible variations of a type
enum FruitPrice: Int {
    case apple = 5
    case orange = 4
    case banana = 8
    case quenepas = 3
    case grapefruit = 10
    
    // computed property
    var stringVersion: String {
        return "\(self.rawValue)"
    }
}

let randomType = FruitPrice.banana

var something: String = "Some string"

// The not so elegant way

if randomType == .apple {
    print("This is an apple")
} else if randomType == .orange {
    print("This is an orange")
} else if randomType == .banana {
    print("This is a banana since its the last we didnt express")
} else {
    print("This is a grapefruit since its the last we didnt express")
}

// The elegant way

switch randomType {
case .apple:
    // rawValue is a property of all enum types
    print("This is apple, and its price is: $\(randomType.rawValue)")
case .orange:
    print("This is orange")
case .banana:
    print("This is banana")
case .grapefruit:
    print("This is grapefruit")
case .quenepas:
    print("This is quenepa")
}

// Grouping cases in a switch statement

switch randomType {
case .orange, .grapefruit:
    print("The fruit is a citrus fruit")
case .apple, .quenepas, .banana:
    print("Not a citrus fruit")
}

// Using the default case of any switch statement

switch randomType {
case .orange:
    print("Love these too!")
case .apple:
    print("Love em!")
default:
    print("Rest I dont care about")
}

let aString = randomType.stringVersion
let aInteger = randomType.rawValue
