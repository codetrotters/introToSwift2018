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
        checklistItems = ChecklistItem.defaultData
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonPressed))
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    @objc private func addButtonPressed() {
        if let newItemViewController = self.storyboard?.instantiateViewController(withIdentifier: "newItem") as? AddChecklistItemViewController {
            newItemViewController.itemModel = ChecklistItem()
            newItemViewController.delegate = self
            navigationController?.pushViewController(newItemViewController, animated: true)
        }
    }
}

extension TableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return checklistItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = checklistItems[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "default")
        cell?.textLabel?.text = item.title
        cell?.detailTextLabel?.text = item.itemDescription
        cell?.accessoryType = item.isSelected ? .checkmark : .none
        return cell ?? UITableViewCell()
    }
}

extension TableViewController {
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Checklist count: \(checklistItems.count), indexPathRow: \(indexPath.row)")
            checklistItems.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        var item = checklistItems[indexPath.row]
        item.isSelected = !item.isSelected
        checklistItems[indexPath.row] = item
        tableView.reloadData()
    }
}

extension TableViewController: AddChecklistItemDelegate {
    func didPressSaveButton(_ item: ChecklistItem) {
        navigationController?.popViewController(animated: true)
        checklistItems.append(item)
        tableView.reloadData()
    }
    
    
}




