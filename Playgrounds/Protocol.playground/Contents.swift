import UIKit

// Protocol




// Protocol: Is a blueprint of properties, functions, and other requirements that another object can adopt. Protocols are not concrete objects, they are more like a requirement list.

protocol Readable {
    // get means we can retrieve the value associated with the variable numberOfPages
    var numberOfPages: Int { get }
    
    // to go to the first page
    func goToFirstPage()
    
    // to go to the last page
    func goToLastPage()
}

// Giving a default implementation on a protocol function in an extension makes that function optional
extension Readable {
    func goToLastPage() {}
}

class Book: Readable {
    
    var numberOfPages: Int {
        get {
            return 300
        }
    }
    
    func goToFirstPage() {
        //take to front of book
    }
    
    //    func goToLastPage() {
    //        //take to back of book
    //    }
}

class Newspaper: Readable {
    
    var numberOfPages: Int = 30
    
    func goToFirstPage() {
        // take to front of newspaper
    }
    
    func goToLastPage() {
        // take to front of newspaper
    }
    
}

let book = Book()
let newspaper = Newspaper()

//book.numberOfPages = 100

print(book.numberOfPages)
