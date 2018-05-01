//
//  CreditCardsViewController.swift
//  Homework8_KL
//
//  Created by Kevin Lopez on 5/1/18.
//  Copyright © 2018 io.ricoLabs. All rights reserved.
//

import UIKit

class CreditCardsViewController: UIViewController {

    var creditCards = [Address]()
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc private func addNewCreditCardButtonPressed() {
        let newAddressVC = storyboard?.instantiateViewController(withIdentifier: "newCreditCard")
            
            
            
            
            
            
            
            
            
            as! UITableViewCell
        
        
        
        
        
        
        navigationController?.pushViewController(newAddressVC, animated: true)
    }
}

extension CreditCardsViewController: AddCreditCardDelegate {
    func didPressSaveButton(_ creditCard: CreditCard) {
        
        
        
        
        
        
        
        creditCards.append(creditCard)
    }
}

extension CreditCardsViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return creditCards.count
    }
    
    
    
    
    
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "helloItsMaria", for: indexPath) as! CreditCardSummaryCell
        let creditCard = creditCards[indexPath.row]
        
        cell.nameLabel.text = creditCard.expirationDate
        
        return cell
    }
}
