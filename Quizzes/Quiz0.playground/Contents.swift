//: Playground - noun: a place where people can play

import UIKit

// NAME:
// DATE: 03/29/18



// Quiz 0

// 1) Create an example of a constant named ‘fruit’ of type String, with a default value of any fruit you’d like.

// A:

let fruit: String = "apple"

// 2) Create an example of a variable named ‘breadPrice’ of type Double, with a default value equal to the value of a quarter.

// A:

var breadPrice = 0.25

// 3) What is the main difference between a constant and a variable?

// A:


// 4) What tool in Xcode can one use to create the skeleton of an application’s UI?
//      i)   Size inspector
//      ii)  Attributes inspector
//      iii) Interface builder
//      iv)  XML

// A:

// 5) Which one of the following gives your code access to an element in your storyboard/nibs?
//      i)   IBAction
//      ii)  var
//      iii) let
//      iv)  IBOutlet
//      v)   class

//  A:

// 6) Which of the following life cycle functions for a UIViewController is only called once in the view controller’s lifetime?
//      i)   viewDidLoad
//      ii)  viewWillAppear
//      iii) viewDidAppear
//      iv)  viewWillDisappear
//      v)   viewDidDisappear

//  A: i)

// 7) Which of those lifecycle functions is called each time the view appears?

//  A:

// 8) Fill in the blank of the statement below for the following class:

    class CustomViewController: UIViewController {
    }

//  CustomViewController is the ______ of UIViewController
//      i)   super
//      ii)  class
//      iii) subclass
//      iv)  superclass

//  A:

// 9) Fill in the blank of the statement below for the following class:

    class TitleLabel: UILabel {
    }

//  UILabel is the ______ of TitleLabel
//      i)   super
//      ii)  class
//      iii) subclass
//      iv)  superclass

//  A:

// 10) What is the default value for the following?

//    var something: String?

//      i)   “”
//      ii)  NULL
//      iii) nil
//      iv)  String
//      v)   “something”

//  A:

// 11) Instantiate the property below and set the text equal to 'Hola PR' only if the property exists (hint: unwrap the optional first)

    var bigTitleLabel: UILabel?

    bigTitleLabel?.text = "Hola PR"

    if let label = bigTitleLabel {
        label.text = "Hola PR"
    }
