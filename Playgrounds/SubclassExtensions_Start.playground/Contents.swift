import UIKit

// Subclass and Extensions

extension UIColor {
    class var grapeFruit: UIColor {
        return UIColor(red: 253.0 / 255.0, green: 161.0 / 255.0, blue: 133.0 / 255.0, alpha: 1.0)
    }
}


class Fruit {
    var name: String
    var color: UIColor
    
    init(name: String, color: UIColor) {
        self.name = name
        self.color = color
    }
}

extension Fruit {
    
    var printOutText: String {
        return "This fruit is called \(name)"
    }
}

class Apple: Fruit {
    convenience init() {
        self.init(name: "apple", color: .red)
    }
}

class Orange: Fruit {
    convenience init() {
        self.init(name: "orange", color: .orange)
    }
}

class Grapefruit: Fruit {
    // Max value for any tint in RGB scale is 255
    // R: 253 G: 161, B: 133
    convenience init() {
        self.init(name: "grapefruit", color: .grapeFruit)
    }
}

let apple = Apple()
let orange = Orange()
let grapeFruit = Grapefruit()

apple.color
orange.color
grapeFruit.color
