import UIKit

// Collections




// Array: Holds elements of a single type in an ordered list. Can hold any kinds of elements - integers, strings, and to classes. Can hold multiple elements of the same value.

let literalDeductions = Array(arrayLiteral: 50.00, 25.00, 10.00, 35.00)

var deductions = [ 50.00, 25.00, 10.00, 35.00 ]

let newDeductions1: [Double] = []

let newDeductions2 = [Double]()

let newDeductions3: Array<Double> = []


// Adding to the array

deductions.append(13.00)

// Removing by index

deductions.remove(at: 1)

// Getting count of array

print("The total number of deductions is \(deductions.count)")


// What is the total amount of deductions?

var totalAmount = 0.00
for deduction in deductions {
    totalAmount += deduction
}

print("The total amount is $\(totalAmount)") //not formatted the way we want, need double zeros in text

// Correctly formatting string value to dollars

let totalAmountString = String(format: "-* ", arguments: [totalAmount]) //gives me a string with correctly formatted dolla value
print("The total amount is $\(totalAmountString)")


// High level function use can make lines 36 - 39 more concise

var newTotalAmount = 0.00
deductions.map({ newTotalAmount += $0 })

"The new total amount is $" + String(format: "%.2f", arguments: [newTotalAmount])


// Convenience functions to note with arrays

deductions.removeFirst()
deductions.removeLast()
deductions.removeAll()




// Set: A collection of unique elements, where order is not maintained or guaranteed. Preferred type of collection when you need to hold a set of unique elements, or need to test efficiently for membership.

// testing membership

let ingredients: Set = ["sugar", "cocoa powder", "salt", "egg", "flour", "cinnamon"]
if ingredients.contains("sugar") {
    print("Skipping this receipe. Too sweet.")
}

// unique elements

var raffelEntries: Set = [ "Jose", "Ricardo", "Ana", "Lola" ]

// Ricardo attempts to add another entry into the raffel, even though there's a one per person limit
raffelEntries.insert("Ricardo")

// the set remain unchanged
raffelEntries

// but Sara adds her name to the raffel, and successfully gets added to the Set of entries
raffelEntries.insert("Sara")

// the new sset
raffelEntries




// Dictionary: A type of hash table that allows for fast access to a value with a given key. The key must be a hashable, such as string or number. The value for a given key can be any object

var users = [ "abc123" : "Jose",
              "abc456" : "Ricardo",
              "abc789" : "Ana",
              "def123" : "Lola" ]

// When declaring a new variable with a default empty dictionary, you must specify the key and value types.
// Whereas, above, it was inferred

var newUsers: Dictionary<String, String> = [:]

// Acccesing a value from a dictionary can be done by subscripting with a key.

let nameOfUser = users["abc123"]
// Notice that name of user is optional, because it is possible that the dictionary doesn't have any value for such key.

// Adding new users
newUsers["def456"] = "Sara"
newUsers["def789"] = "Rebecca"

// Combine dictionaries, only if both key-values types match

users.merge(newUsers) { (_, new) in new }
// then change Sara's id to be the same as Jose, and show that Jose's entry disappears. Show that changing the merge logic, we can keep the current key-value over the new one.

// Counting the number of keys

let numberOfKeys = users.keys.count

// Printing out the names of all users in the dictionary

var allNames = ""
for key in users.keys {
    let name = users[key]
    allNames += "\(name!), "
}

print("All users in dictionary: \(allNames)")
