//
//  TableViewController.swift
//  TableView_KL_Class
//
//  Created by Kevin Lopez on 4/10/18.
//  Copyright © 2018 io.ricoLabs. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var checklistItems: [ChecklistItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "To-Do List"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonPressed))
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    @objc private func addButtonPressed() {
        if let newItemViewController = self.storyboard?.instantiateViewController(withIdentifier: "newItem") as? AddChecklistItemViewController {
            newItemViewController.itemModel = ChecklistItem()
            navigationController?.pushViewController(newItemViewController, animated: true)
        }
    }
}

extension TableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return checklistItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = "This is the first cell"
        cell.detailTextLabel?.text = "Description of cell"
        return cell
    }
}






