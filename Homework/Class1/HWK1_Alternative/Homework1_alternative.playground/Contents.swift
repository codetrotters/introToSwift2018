
// Homework 1_alternative
// 03/29/2018

//  1) Read and complete chapters 3, 4, 5, 6 from the Ray Wenderlich pdf found in our course repo

//  2)

//  i) Create a new app project, Single view, and call it 'Homework1_[initials]'. In the main view of the app, I want you to add the following: 3 UILabels, 1 UIImageView and 1 SegmentControl. Use autolayout to configure the view to look like the design provided (firstIteration_alternative.png).

//  ii) Then in code, I want you to create a data model as a value type that will represent a product with the following properties:

//  name: String
//  manufacturer: String
//  price: Double

//  iii) Then when the main view controller loads, instantiate 3 instances of the product data model (with any custom data you'd like, though model it after a real life example), and then configure the segment control so that it displays the 3 product names.

//  iv) When each segment is pressed, the view should update so that the labels show the name, manufacturer, and price. Dont worry about the image at this point.

//  v) The padding around the segment control should be 20px. The image should be a square and the content mode of the UIImageView should be 'Aspect Fill'. The other constraints, you can decide what they should be to match as close to the alternative.png design.

//  vi) Add a property of type URL that represents the imageURL in the data model. Find the corresponding image URL for each product and make sure to add them to the corresponding data model when instantiating them. Then when a segment is selected, fill the image using the imageURL property. When the app first launches, set the background color of the UIImageView to gray.

