// Homework 5
// 04/12/2018

//  1) Read and complete chapter 10 from the Ray Wenderlich pdf found in our course repo


//  2)
//
//  A) Create a new app project, Single view, and call it 'Homework5_[initials]'. Embed the view controller in your Main.storyboard in a navigation controller, so we can have a navigation bar. Set the view controller title to 'Color Table'
//
//
//
//  B) In your Main.storyboard, select the View Controller's View and change its background color to 'Group Table View Background Color'. Then add a segment control to the view and give it a third segment. Name the segments as follows (from left to right): Reds, Blues, Random. Add the following constraints to the segment control:
//
//      - Leading: 10
//      - Trailing: 10
//      - Top to Safe Area: 10
//
//
//
//  C) Now add a table view to the View Controller's view and place it underneath the segment control. Add the following constraints to the table view:
//
//      - Leading: 10
//      - Trailing: 10
//      - Top to segment control: 10
//      - Bottom to Safe Area: 10
//
//  after adding the constraints, add a UIVIew to the table view so we can replace the default footer. Make sure that new view is inside the table view by looking at the hierarchy of the views on the left hand side of Interface Builder. Then change the height of that view to zero.
//
//
//
//  D) While looking at the Main.storyboard, hold Option key and click on the ViewController.swift file. Then add IBOutlets for both the segment control and the table view, naming them 'segmentControl' and 'tableView' collectively. Then implement a didSet for both UI elements. Leave them empty for now.
//
//
//
//  E) Add a private function called 'segmentControlValueChanged', and make sure its exposed to Objective-C by adding '@objc' before the word 'private'. Then in the didSet of segmentControl call the function addTarget:action:for on the segment control. For the selector, provide the newly added function 'segmentControlValueChanged'. Add a print function in here that prints out the segmentCotrol's selectedSegmentIndex value. Build the app and make sure that when you select a new segment, the correct segment index prints out on your Xcode log console.
//
//
//
//  F) Then in your tableView's didSet, set the tableView's delegate and dataSource equal to that ViewController instance. Following that, add two extensions to ViewController. In one extension, have it so ViewController conforms to UITableViewDataSource, and the other to UITableViewDelegate. For the UITableViewDataSource, make sure to add the two required functions to conform to that protocol. Return 1 for the number of rows, and an instance of UITableViewCell for the other. At this point, if you build your app, it should look like screenshotA.
//
//
//
//  G) Then in your project folder, create a new Swift file and name it ColorViewModel. Make it a value type object named 'ColorViewModel'. Add the following properties:
//
//      name: String
//      color: UIColor
//      isSelected: Bool
//
//
//
//  H) Then add another new swift file, and call it 'ColorManager'. Make it a value type object named 'ColorViewModel'. First create a static constant called 'maxRGBValue' of type UInt32, setting the value to 255. Then add another static constant called 'maxRGBFloatValue' of type CGFloat, and set it equal to maxRGBValue but casted to a CGFloat type. It will be apparent soon why we need that value in both number types.
//
//
//
//  I) Create a static variable called  'randomRGBValue' of type CGFloat. Using the arc4random_uniform function, in the static computed variable 'randomRGBValue', return a random CGFloat number from 0 to the maxRGBValue (including that max value). If you don't know how to use the function, look it up to learn about it. Hint: In the return, you'll have to cast the random value into the appropriate type.
//
//
//
//  J) Next, create a static function called 'generateRedColors(desired numberOfColors: Int)' and have that function return an array ColorViewModel's. In that function I want you to do the following:
//
//      1) Create a variable called 'randomRedValues' and set it equal to an empty array of CGFloat's.
//
//      2) Create a for loop that iterates from 0 to the number before the provided 'numberOfColors'.
//
//      3) In that for loop, I want you to append the value of 'randomRGBValue' to the array 'randomRedValues'.
//
//      4) Now outside and underneath that loop, create another variable called 'redColors', and set it equal to an empty
//      array of ColorViewModel's
//
//      5) Then write a for-in loop that iterates through each redValue in randomRedValues.
//
//      6) In that for-in loop, create a constant called 'color', and set it equal to a new instance of UIColor. In the initialization of the UIColor, use the redValue for the Red parameter, and zeros for the Blue and Green paramters. For alpha, set it equal to 1. All alphas in this homework will be assumed to be equal to 1. Make sure that you divide by the maxRGBFloatValue when entering the red value in UIColor's constructor.
//
//      7) In that same for-in loop, create a constant called 'colorName' and set it equal to a formatted String. The format of the string should be "R: %.0f, G: %.0f, B: %.0f, A: %.0f", where you will provide the arguments paramter with the values of the UIColor in an array (ex: [redValue, 0, 0, 1]).
//
//      8) Then create another constant called 'colorViewModel' and set it equal to an instantiated ColorViewModel, which uses the constants 'colorName' and 'color'. Pass false to the 'isSelected' property.
//
//      9) For the last piece of logic in that for-in loop, append the 'colorViewModel' to the 'redColors' array.
//
//  now outside and underneath that for-in loop, return the ColorViewModel array called 'redColors' so that your generateRedColors is finished.
//
//
//
//  K) In your ViewController.swift file, add variable property to the controller called 'redColorViewModels', setting it equal to an empty array of ColorViewModel's. In viewDidLoad, set redColorViewModels equal to the resulting array of ColorViewModel's from the ColorManager's function 'generateRedColors'. Generate 100 of those red ColorViewModels. Then after that line of code, called reloadData() on your view controller's tableView.
//
//
//
//  L) Now update the numberOfRows function so that the integer returned is the count of the redColorViewModels array. In the cellForRow function, create a constant called 'colorViewModel' and set it equal to the redColorViewModel using the indexPath's row and the property 'redColorViewModels'. Then create a constant called cell that's equal to an instantiated UITableViewCell. Set the background color of that cell to be equal to the colorViewModel's color property. Then sent the cell's textLabel text to the colorViewModel's name property. Finally set that textLabel's textColor to white, and return that cell. At this point, if you build your app, it should look like screenshotB.
//
//
//
//  M) For this last section of your homework, I will not go into all the small steps, but I will explain what you are to achieve. I want you to update your code so that when you select the Blues segment, the table view shows 100 random blue hues of blue. You will have to modify ColorManager and ViewController do this. Finally, when the Random segment is selected, I want 100 hues to show on the table. This will take randomizing all values of the RGB. Tapping on the Red segment again will return the table view into showing 100 random red hues.
//
//
//  N) Lastly, I want you write code so that when a cell is tapped, that cell is considered selected and an accesory item checkmark is shown for selected rows. To make sure youre storing the state correctly, scroll up and down the table and make sure that the ones you selected don't change after scrolling away and back to them.
//
//

