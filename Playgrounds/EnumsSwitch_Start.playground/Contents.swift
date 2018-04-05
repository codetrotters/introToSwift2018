import UIKit

// Enums and Switch




// an enum encapsulates all possible variations of a type

// no duplicate values in your cases
enum FruitPrice: Int {
    case apple = 5
    case orange = 4
    case banana = 8
    case quenepas = 3
    case grapefruit = 10
    
    var string: String {
        return "\(self.rawValue)"
    }
}

let applePrice = FruitPrice.apple.string


let randomPriceType = FruitPrice.banana

// Not so elegant way

if randomPriceType == .apple {
    print(randomPriceType.string)
} else if randomPriceType == .orange {
    print("This is an orange")
} else if randomPriceType == .banana {
    print("This is a banana")
} else {
    print("This is a grapefruit")
}

// Elegant switch

switch randomPriceType {
case .apple:
    print("This is apple")
case .orange:
    break
case .banana:
    print("edgerger")
case .grapefruit:
    print("rtergerg")
default:
    break
}

