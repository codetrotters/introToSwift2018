//
//  AddCreditCardViewController.swift
//  Homework8_KL
//
//  Created by Kevin Lopez on 5/1/18.
//  Copyright © 2018 io.ricoLabs. All rights reserved.
//

import UIKit

enum CardDetailSectionCellType: Int {
    case FirstName
    case lastName
    case CardNumber
    case expirationDate
    case SecurityCode
    
    var txt: String {
        switch self {
        case .firstName:
            return "First Name"
        case .lastName:
            return "Last Name"
        case .cardNumber:
            return "Card Number"
        case .expirationDate:
            return "Expiration Date"
        case .securityCode:
            return "Security Code"
        }
    }
    
    static var count: Int {
        return CardDetailSectionCellType.securityCode.rawValue + 1
    }
}

enum AddressSectionCellType: Int {
    case addressOne
    case addressTwo
    case cityTown
    case state
    case zipCode
    
    static var count: Int {
        return AddressSectionCellType.zipCode.rawValue + 1
    }
}

enum NewCreditCardSectionType: Int {
    case cardDetails
    case address
    
    var txt: String {
        switch self {
        case .cardDetails:
            return "Card Details"
        case .address:
            return "Address"
        }
    }
}

protocol AddCreditCardDelegate: class {
    func didPressSaveButton(_ creditCard: CreditCard)
}

class AddCreditCardViewController: UIViewController {
    
    var newCreditCard = CreditCard()
    
    @IBOutlet weak var tableView: UITableView!
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add Credit Card"
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: .UIKeyboardWillHide, object: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonPressed))
        navigationItem.rightBarButtonItem?.isEnabled = false
    }
    
    @objc private func saveButtonPressed() {
    }
    
    private func updateSaveButton() {
        navigationItem.rightBarButtonItem?.isEnabled = newCreditCard.isCardFullyFilledOut
    }
}

extension AddCreditCardViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return NewCreditCardSectionType(rawValue: section)?.txt
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionType = NewCreditCardSectionType(rawValue: section)!
        switch sectionType {
        case .cardDetails:
            return CardDetailSectionCellType.count
        case .address:
            return AddressSectionCellType.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionType = NewCreditCardSectionType(rawValue: indexPath.section)!
        
        switch sectionType {
        case .cardDetails:
            let cellType = CardDetailSectionCellType(rawValue: indexPath.row)!
            return cardDetailCellFor(cellType, indexPath)
    
        case .address:
            let cellType = AddressSectionCellType(rawValue: indexPath.row)!
            return addressCellFor(cellType, indexPath)
        }
    }
    
    private func cardDetailCellFor(_ cellType: CardDetailSectionCellType, _ indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "textEntryCell", for: indexPath) as! TextEntryCell
        cell.fieldName.text = cellType.txt
        cell.delegate = self
        cell.cardDetailCellType = cellType
        
        switch cellType {
        case .expirationDate, .securityCode:
            cell.textField.keyboardType = .numberPad
        default:
            cell.textField.keyboardType = .decimalPad
        }

        return cell
    }
    
    private func addressCellFor(_ cellType: AddressSectionCellType, _ indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "textEntryCell", for: indexPath) as! TextEntryCell
        cell.addressCellType = cellType
        
        switch cellType {
        case .zipCode:
            cell.textField.keyboardType = .default
        default:
            cell.textField.keyboardType = .emailAddress
        }

        return cell
    }
}

extension AddCreditCardViewController {
    @objc func keyboardWillShow(_ sender: Notification) {
        let height: CGFloat = (sender.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.size.height ?? 0
        let duration: TimeInterval = (sender.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0
        let curveOption: UInt = (sender.userInfo?[UIKeyboardAnimationCurveUserInfoKey] as? NSNumber)?.uintValue ?? 0
        
        UIView.animate(withDuration: duration, delay: 0, options: UIViewAnimationOptions(rawValue: UIViewAnimationOptions.beginFromCurrentState.rawValue|curveOption), animations: {
            let edgeInsets = UIEdgeInsetsMake(0, 0, height, 0)
            self.tableView.contentInset = edgeInsets
            self.tableView.scrollIndicatorInsets = edgeInsets
        }, completion: nil)
    }
    
    @objc func keyboardWillHide(_ sender: Notification) {
        let duration: TimeInterval = (sender.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0
        let curveOption: UInt = (sender.userInfo?[UIKeyboardAnimationCurveUserInfoKey] as? NSNumber)?.uintValue ?? 0
        
        UIView.animate(withDuration: duration, delay: 0, options: UIViewAnimationOptions(rawValue: UIViewAnimationOptions.beginFromCurrentState.rawValue|curveOption), animations: {
            let edgeInsets = UIEdgeInsets.zero
            self.tableView.contentInset = edgeInsets
            self.tableView.scrollIndicatorInsets = edgeInsets
        }, completion: nil)
    }
}

extension AddCreditCardViewController: TextEntryDelegate {
    
    func didUpdateField(_ text: String, _ cardDetailCellType: CardDetailSectionCellType?, _ addressCellType: AddressSectionCellType?) {
        
        if let addressType = addressCellType {
           newCreditCard = newCreditCard.updateAddressDetail(addressType, text)
        }
    }
}
























