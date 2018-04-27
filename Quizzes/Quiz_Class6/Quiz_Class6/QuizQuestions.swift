//
//  QuizQuestions.swift
//  Quiz_Class6
//
//  Created by Kevin Lopez on 4/24/18.
//  Copyright © 2018 io.ricoLabs. All rights reserved.
//

import UIKit

//
//  1) If I want to create a blueprint of properties/functions that an object can conform to, I can use a what?
//
//  A: protocol
//
//  2) What are the two functions that are necessary in order to conform to UITableViewDataSource?
//
//  i) numberOfSections
//  ii) numberOfRows
//  iii) didSelectRow
//  iv) cellForRow
//  v) allOfTheAbove
//
//  A: ii, iv
//
//  3) If a tableview is added to a view controller, what are the TWO properties that need to be set in order for the view controller to provide table data & handling of its interactions?
//
//  A: delegate and datasource
//
//  4) Create a value type object in this project called 'Note' and give it the following properties:
//
//  i) name
//  ii) dateCreated
//  iii) isNew
//
//  select the appropriate type for each property
//
//  5) What must be defined for a UIView in order for it's layout to be fully defined?
//
//  i)   origin
//  ii)  origin, center
//  iii) origin, size
//  iv)  center, size
//  v)   option iii & iv
//  vi)  option ii & iii
//
//  6) Add an extension to your Note type & add a 'isNewText' computed property of type String, and have it return a string that would look like:
//
//  "Note named NOTE_NAME is brand new"
//   or
//  "Note named NOTE_NAME was created more than 5 mins ago"
//
//  7) Describe to me all the things that are problematic or can be improved w/ the following code?
//
//  A:
//


// For question 7


enum ViewStateType {
    case loading
    case loaded
    case failed
}

class MainViewController: UIViewController {
    
    var modalVC: ModalViewController!
    var viewState: ViewStateType = .loading
}

class ModalViewController: UIViewController {

    weak var mainVC: MainViewController!
    var viewState: ViewStateType = .loading
}
