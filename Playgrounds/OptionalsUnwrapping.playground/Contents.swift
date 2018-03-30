import UIKit

// Optionals and Unwrapping

let title = "CodeTrotters"
let classSize: Int = 10
var teachingAssistantName: String?

// for Swift Course, we do have an assistant

teachingAssistantName = "Eduardo"

// If let statement

// Used in sequence of code where there is more code underneath that needs to be executed
if let teachingAssistant = teachingAssistantName {
    print("We do have an assistant and their name is: \(teachingAssistant)")
}

// Guard statement

// Typically used on top of functions to prevent further execution

func running() {
    guard let teachingAssistant = teachingAssistantName else {
        return
    }
    print("We have teaching assistant: \(teachingAssistant), lets run it!")
}
