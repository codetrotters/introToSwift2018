import UIKit

// Collections




// Array: Holds elements of a single type in an ordered list. Can hold any kind of element - integeres, strings, and classes. Can hold multiple elements of the same value.

let literalDeductions = Array(arrayLiteral: 50.00, 25.00, 10.00, 35.00)

var deductions = [ 50.00, 25.00, 10.00, 35.00 ]

// Create an array to hold new deductions

let newDeductions1: [Double] = []

let newDeductions2 = [Double]()

let newDeductions3: Array<Double> = []


// Add to the array

deductions.append(13.00)

// Removing by index

deductions.remove(at: 1)

// Count of an array

print("The count of deductions is: \(deductions.count)")


// What is the total amount of deductions?

var totalAmount = 0.00
for deduction in deductions {
    totalAmount += deduction
}

print("The total amount of deductions is: \(totalAmount)")


var newTotalAmount = 0.00
for i in 0..<deductions.count {
    let deduction = deductions[i]
    newTotalAmount += deduction
}

print("New total amount is: \(newTotalAmount)")

// High level functions

// Sort

deductions.sort { (firstDeduction, secondDeduction) -> Bool in
    return firstDeduction > secondDeduction
}

deductions.sort(by: { return $0 < $1 })
deductions

// Map

// Map iterates through each element like a for loop

//var totalAmount = 0.00
//for deduction in deductions {
//    totalAmount += deduction
//}

var totalAmountMapped = 0.00
deductions.map({ totalAmountMapped += $0 })

totalAmountMapped



"The total amount is $" + String(format: "%.2f", arguments: [totalAmount])


// Finding if an element is contained in an array
deductions.contains(13.00)

// Examples of array functions
deductions.removeFirst()
deductions.removeLast()
deductions.removeAll()


// Set: A collection of unique elements, where order is not maintained or guaranteed. Preferred when you need to hold a set of unique elements, or need to test efficiently for membership (is a specific element inside this array)


let ingredients: Set = ["sugar", "cocoa powder", "salt", "egg", "flour", "cinnamon"]
if ingredients.contains("sugar") {
    print("esto esta muy sweet")
}

// unique elements

var raffelEntries: Set = ["Jose", "Ricardo", "Ana", "Lola"]

raffelEntries.insert("Ricardo")

raffelEntries.insert("Sarah")

raffelEntries





// Dictionary: A type of hash table that allows for fast access to a valye with a given key. The key must be hashable, such as string or number. The value for a given key can be of any type.

var users = [ "abc123" : "Jose",
              "abc456" : "Ricardo",
              "abc789" : "Ana",
              "def123" : "Lola" ]

// Empty dictionary
var newUsers: Dictionary<String, String> = [:]

// accessing a value from a dictionary
 let nameOfUser = users["abc123"]

// add new users
newUsers["abc123"] = "Sarah"
newUsers["def789"] = "Rebecca"

// Combine dictionaries

users.merge(newUsers) { (old, _) in old }
users

// Count in dictionary

let numberOfKeys = users.keys.count

// Print out all the names in the users dictionary

var allNames = ""
for key in users.keys {
    let name = users[key]
    allNames += "\(name!), "
}

print("All users in dictionary: \(allNames)")











