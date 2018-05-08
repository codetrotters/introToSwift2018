//
//  Final Project Instructions
//
//  Now that you've been exposed to the Swift fundamentals and techniques in building good UI and API interaction, you are now ready to focus on the final project for the class.
//
//  Each student will plan, execute, and deliver their version of the final project.
//
//
//  Final Project Mission:
//
//  The Puerto Rican government has plenty of data available for the public to access. You're mission is to choose a set of data from their many data sets and build an application that fetches, displays, and caches part of the data locally. The site containing all of PR's open data is: https://data.pr.gov/en/
//
//  Project Requirements:
//
//  1) Load data from a selected data set from https://data.pr.gov/en/
//      You must use Alamofire via Cocoapods to load the data.
//
//  2) Display the data in a UITableViewController, using your own custom UITableViewCell. The cell must show at least 4 different pieces of information pertaining to your dataset.
//
//  3) When pulling down on the table view to refresh, the dataset should be cleared and fetched again from the pr.gov database.
//
//  4) Selecting a cell should take the user to a detail view (via a navigation push) that will show the user at least 8 pieces of information (including the 4 that were shown on the table view)
//
//  5) In the detail view, add a navigation bar button item that will be used to Favorite or Unfavorite this specific item.
//
//  6) Your main application should open up to a UITabBarController that has the following tabs:
//
//      A) TYPE_OF_DATASET (Your name here will depend on your dataset)
//      B) Favorites
//      C) More Info
//
//  the first tab will show the view controller described in parts 1-3.
//
//  7) The Favorites view controller will consist of all the items from the data set that the user decided to favorite from the detail view. In this view, the user should have the ability to delete an item or rearrange the order of the items. Additionally the user should have the option to add a custom item by pressing on an 'Add' navigation bar button item. Pressing on that button will push open an AddViewController. The AddViewController should have textfields for the bare minimum of data you need to create a new item similar to those from the dataset.
//
//  8) The More Info view controller should load a web view that is relevant to your dataset. It could be from pr.gov's site or something relevant and appropriate.
//
//  9) When the application 'resigns active', the application should save the user's favorite data locally. When the application 'becomes active' the application should load any locally saved favorite data.
//
//  10) All data models should conform to Codable.
//
//  11) The application should have a custom launch screen relevant to your dataset
//
//  12) The application should have a specific set of colors and fonts that it uses to provide a consistent user experience.
//
//
//
//  First part of Final Project:
//
//  Research which dataset you want to use for your project, and write out a struct that will represent the fundamental object found in your chose dataset.
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
