import UIKit

// Subclass and Extensions




// Extend classes that don't belong to us, such as UIColor (belong to UIKit/Apple)

extension UIColor {
    
    class var grapeFruit: UIColor {
        return UIColor(red: 249.0 / 255.0, green: 127.0 / 255.0, blue: 105.0 / 255.0, alpha: 1.0)
    }
}

// The ability to subclass is called polymorphism

class Fruit {
    var name: String
    var color: UIColor
    
    init(name: String, color: UIColor) {
        self.name = name
        self.color = color
    }
}

// Extensions are a nice technique to organize related functions in your classes

extension Fruit {
    
    var printOutText: String {
        return "Hi, I am \(name) and my color is \(color)"
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

apple.printOutText
orange.printOutText
grapeFruit.printOutText

