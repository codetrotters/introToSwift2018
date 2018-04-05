import UIKit

// Protocol




// Protocol: Is a blueprint of properties, functions, and other requirements that another object can adopt. Protocols are not concrete objects, they are more like a requirement list.

protocol Readable {
    var numberOfPages: Int { get set }
    
    func goToFirstPage()

    // optional
    func goToLastPage()
}

extension Readable {
    func goToLastPage() {}
}

class Book: Readable {
    var numberOfPages: Int {
        get {
            return 5
        }
        set(newValue) {
            self.numberOfPages = newValue
        }
    }
    
    func goToFirstPage() {
        
    }
    
    func goToLastPage() {
        
    }
}
