// Homework 3
// 04/05/2018

//  1) Read and complete chapter 8 from the Ray Wenderlich pdf found in our course repo

//  2)

//  A) Create a new app project, Single view, and call it 'Homework3_[initials]'. Embed the view controller in your Main.storyboard in a navigation controller, so we can have a navigation bar.
//
//
//
//  B) Add the following onto the view controller in your storyboard:

//      - Label (for the message title)
//          Constraints:
//          leading = 10, trailing = 10, top = 10, bottom to body label = 10
//
//      - Label (for the message body)
//          Constraints:
//          leading = 10, trailing = 10, top to title label = 10,
//          bottom to status label = 10
//          Lines: 0
//
//      - Label (for the status)
//          Constraints:
//          leading = 10, trailing = 10, top to body label = 10
//
//      - Five UIButtons (title font size for each should be changed to 11) inside of a UIStackView and where the stackview has the following constraints:
//
//          leading = 10, trailing = 10, bottom = 10,
//          top to 'Message from:' label = 10, height = 30
//
//          Stackview configuration (from Attributes inspector):
//          - Axis = Horizontal
//          - Distribution = Fill Equally
//          - Spacing = 10
//
//      - Label (for the 'Message from:')
//          Constraints:
//          center horizontally with stackview = 0, bottom to stackview = 10
//
//   and as part of part ii) also copy the text as seen in screenshotA for your labels and buttons. Build your view, it should look like screenshotA up to this point.
//
//
//
//
//  C) In your view controller, add a private function called configureNavigationBar and call this function from viewDidLoad. In the configureNavigationBar function, do the following:
//
//      - Set the title to 'Messages'
//      - Add a left UIBarButtonItem with title, "Refresh" to your view controller's navigationItem. The button should have a target of self and a selector that points to a private function refreshButtonPressed. When you create refreshButtonPressed, you will need to add '@objc' before the word 'private' in order for the bar button to interface with controller. Some strange objective-c leftover logic. Set this refresh button's tint color to darkGray.
//      - Add a right UIBarButtonItem with title, "Edit" to your view controller's navigationItem. The button should have a target of self and a selector that points to a private function editButtonPressed. Set this refresh button's tint color to darkGray. Also set this rightBarButtonItem's property 'isEnabled' to false.

//  for part iii) your view should look like screenshotB.
//
//
//
//
//  D) Create a new Swift file called 'Message' and in there create an enum called 'MessageState' of integer type. Add the following cases in this order: pending, sent, failed.
//
//
//
//
//  E) Then in the same file, create a value type model called 'Message' with the following properties:
//      var fromName: String
//      var body: String
//      var state: MessageState
//
//
//
//
//  F) Add an extension to the Message struct, and in there add a static computed variable called 'defaultData', of type [Message]. That variable should return 5 Message objects using the following sample data:
//
//
//  "Maria"
//  "We are in this for the long haul. We are in this for the long haul. We are in this for the long haul. We are in this for the long haul. We are in this for the long haul. We are in this for the long haul. We are in this for the long haul. We are in this for the long haul. We are in this for the long haul. We are in this for the long haul. We are in this for the long haul."
//  State: Pending

//  "Antonio"
//  "Vamos jugar poker este Sabado a las diez de la tarde. Vamos jugar poker este Sabado a las diez de la tarde. Vamos jugar poker este Sabado a las diez de la tarde. Vamos jugar poker este Sabado a las diez de la tarde. Vamos jugar poker este Sabado a las diez de la tarde. Vamos jugar poker este Sabado a las diez de la tarde. Vamos jugar poker este Sabado a las diez de la tarde. Vamos jugar poker este Sabado a las diez de la tarde. Vamos jugar poker este Sabado a las diez de la tarde."
//  State: Sent
//
//  "Ricardo"
//  "I need to go to the grocery store, I have no food at home. I need to go to the grocery store, I have no food at home. I need to go to the grocery store, I have no food at home. I need to go to the grocery store, I have no food at home. I need to go to the grocery store, I have no food at home. I need to go to the grocery store, I have no food at home. I need to go to the grocery store, I have no food at home."
//  State: Failed
//
//  "Jessica"
//  "Would you like to go to the movies tomorrow, quiero ver esa pelicula. Would you like to go to the movies tomorrow, quiero ver esa pelicula. Would you like to go to the movies tomorrow, quiero ver esa pelicula. Would you like to go to the movies tomorrow, quiero ver esa pelicula. Would you like to go to the movies tomorrow, quiero ver esa pelicula. Would you like to go to the movies tomorrow, quiero ver esa pelicula."
//  State: Pending
//
//  "Alex"
//  "Voy para la casa de mi mai esta manana. Voy para la casa de mi mai esta manana. Voy para la casa de mi mai esta manana. Voy para la casa de mi mai esta manana. Voy para la casa de mi mai esta manana. Voy para la casa de mi mai esta manana. Voy para la casa de mi mai esta manana. Voy para la casa de mi mai esta manana."
//  State: Sent
//
//
//
//
//  G) In ViewController.swift, add a variable property to the class called 'messages' of type [Message], and make sure to initialize it as you declare it with an empty array. Create a private function called 'loadMessages' and set your new 'messages' property equal to the default data you setup in the previous step. Then make sure to call that function from viewDidLoad.
//
//
//
//
//  H) Using Main.storyboard and ViewController.swift, create an IBOutlet that can hold an array of UIButtons, calling the outlet 'messageButtons'. Connect all five buttons to the outlet. Next, in your storyboard, change the tag value of each button as so: first button = 1, second button = 2, third button = 3, and so forth. Next, in your ViewController.swift file, create a private function called 'configureButtons', and in here you want to do the following:
//
//      - write a for-in loop where you iterate the array of buttons
//      - in each iteration, create a constant called 'index' which equals the button's tag - 1, create a constant called 'message' that equals to the indexed message from the array 'messages', and finally set the button's title equal to the message's fromName property.

//
//  then you will want to call that private function 'configureButtons' in viewDidLoad and you should now see the app as screenshotC.
//
//
//
//
//  I) Using Main.storyboard and ViewController.swift, create IBOutlets for the top three labels, calling them the following: fromNameLabel, bodyLabel, stateLabel. Then control-select-drag from the first message button in your storyboard to your ViewController to add an IBAction called 'messageButtonPressed', make the sender type UIButton, instead of Any. Following that, control-select-drag from each of the other buttons to that same IBAction so that all the message button interactions run through 'messageButtonPressed'. In that IBAction function, grab the index from the button tag as done before, grab the message for that index, and then set the text for all three top labels (fromNameLabel, bodyLabel, and stateLabel). For the stateLabel, have it say "State: \("")". You will notice that before you can provide the state as a String you have to modify the enum MessageState. In there, add a variable called 'txt' of type String, switch against its self, and return the String equivalence of that case. Now go back and modify the setting of the stateLabel.
//
//  if you build the app and interact with the message buttons, the top labels should update and reflect the appropriate data.
//
//
//
//
//  J) Lastly, I want you to investigate how to add simple UIView animations in Swift. When you think youre ready tp try, I want you to animate the label 'Messages from:' and all of the buttons as a unit from the bottom of the screen to where you see it just before starting this part of the homework. This animation should begin when the view appears, and these UI elements shouldn't be visible prior to the animation starting. Make the animation last 1 second.
//
//
//
//
//
//
//




