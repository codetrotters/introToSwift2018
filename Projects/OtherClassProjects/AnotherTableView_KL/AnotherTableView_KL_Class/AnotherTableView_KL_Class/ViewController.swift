//
//  ViewController.swift
//  AnotherTableView_KL_Class
//
//  Created by Kevin Lopez on 4/19/18.
//  Copyright © 2018 io.ricoLabs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModels = [DetailViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Another Table View"
        viewModels = DetailViewModel.defaultData
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = viewModels[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as? DetailTableViewCell
        cell?.configureWith(viewModel)
        return cell ?? UITableViewCell()
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewModel = viewModels[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        presentActionSheetWith(viewModel)
    }
    
    private func presentActionSheetWith(_ viewModel: DetailViewModel) {
        let actionSheetController = UIAlertController(title: "Select Action", message: "Select action for view model", preferredStyle: .actionSheet)
    
        let modalAction = UIAlertAction(title: "Modal", style: .default) { [weak self] (_) in
            self?.presentModal(viewModel)
        }
        let pushAction = UIAlertAction(title: "Push", style: .default) { [weak self] (_) in
            self?.pushView(viewModel)
        }
        
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { (_) in
            self.delete(viewModel)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        actionSheetController.addAction(modalAction)
        actionSheetController.addAction(pushAction)
        actionSheetController.addAction(deleteAction)
        actionSheetController.addAction(cancelAction)
        
        navigationController?.present(actionSheetController, animated: true, completion: nil)
        
        // every object referenced inside a completion block receives a strong reference by the function/object owning the completion block
        
        // navController >s viewController
        // navController >s alertController
    }
    
    private func presentModal(_ viewModel: DetailViewModel) {
        let modalVC = storyboard?.instantiateViewController(withIdentifier: "modal") as! ModalViewController
        
        self.definesPresentationContext = true
        modalVC.modalPresentationStyle = .overCurrentContext
        
        modalVC.viewModel = viewModel
        navigationController?.present(modalVC, animated: true, completion: nil)
    }
    
    private func pushView(_ viewModel: DetailViewModel) {
        let pushedVC = storyboard?.instantiateViewController(withIdentifier: "pushed") as! PushedViewController
        pushedVC.viewModel = viewModel
        navigationController?.pushViewController(pushedVC, animated: true)
    }
    
    private func delete(_ viewModel: DetailViewModel) {
        viewModels = viewModels.filter({ $0.imageName != viewModel.imageName })
        tableView.reloadData()
    }
}
