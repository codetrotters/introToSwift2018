//
//  TextEntryCell.swift
//  Homework8_KL
//
//  Created by Kevin Lopez on 5/1/18.
//  Copyright © 2018 io.ricoLabs. All rights reserved.
//

import UIKit

protocol TextEntryDelegate: class {
    func didUpdateField(_ text: String, _ cardDetailCellType: CardDetailSectionCellType?, _ addressCellType: AddressSectionCellType?)
}

class TextEntryCell: UITableViewCell {
    weak var delegate: TextEntryDelegate?
    
    
    
    
    
    var cardDetailCellType: CardDetailSectionCellType? = nil
    
    
    
    
    var addressCellType: AddressSectionCellType? = nil
    
    @IBOutlet weak var fieldName: UILabel!
    
    
    
    
    
    @IBOutlet weak var textField: UITextField!
}

extension TextEntryCell: UITextFieldViewMode {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let currentText = textField.text else { return true }
        
        let expectedText = (currentText as NSString).replacingCharacters(in: range, with: string)
        
        
        
        
        
        
        if cardDetailCellType == CardDetailSectionCellType.expirationDate  {
            if currentText.count == 2 {
                
                
                
                
                
                textField.text = textField.text! + "/"
            }
            
            if expectedText.count > 5 {
                return false
            }
        }
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}
