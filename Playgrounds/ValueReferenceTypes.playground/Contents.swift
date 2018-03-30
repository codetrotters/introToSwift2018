import UIKit

// Value and Reference Types




// Reference Types

// A reference type is a type where its value in memory can be shared among other references. For example, when creating a new variable and setting it equal to a reference type, the new variable will point to the same value in memory.




// Value Type

// A value type is a type where its value in memory is always unique. For example, when creating a new variable and setting it equal to a value type, the new variable will have the same value but in a different place in memory.




// Reference Type example

// class is the fundamental reference type in Swift
// all classes need an initializer OR all of its properties must have an initial value

class SaleProduct {
    var name: String
    
    // this init is the function that needs to be called if you want an instance of this class, SaleProduct
    init(desiredName: String) {
        self.name = desiredName
    }
}

let table = SaleProduct(desiredName: "table")
let chair = table // this line of code adds a new reference to the same copy of table in memory
chair.name = "chair"

table.name
chair.name




// Value Type example

// struct is the fundamental value type in Swift

struct Product {
    var name: String
}

let blanket = Product(name: "blanket")
var pillow = blanket //this line of code makes a copy of the appleFruit in memory
pillow.name = "pillow"

blanket.name
pillow.name


// The majority of objects you will use are structs. Classes are most often used with view controllers. Good thing too because we don't want to create multiple copies of our views!

