//
//  AddChecklistItemViewController.swift
//  TableView_KL_Class
//
//  Created by Kevin Lopez on 4/10/18.
//  Copyright © 2018 io.ricoLabs. All rights reserved.
//

import UIKit

class AddChecklistItemViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField! {
        didSet {
            nameTextField.delegate = self
            let attributes = [NSAttributedStringKey.foregroundColor : UIColor.lightGray]
            let attributedPlaceholder = NSAttributedString(string: "Name", attributes: attributes)
            nameTextField.attributedPlaceholder = attributedPlaceholder
        }
    }
    
    var placeholderDescriptionText = "Description"
    
    @IBOutlet weak var descriptionTextView: UITextView! {
        didSet {
            descriptionTextView.text = placeholderDescriptionText
            descriptionTextView.delegate = self
            descriptionTextView.textColor = UIColor.lightGray
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "New Item"
    }
}

extension AddChecklistItemViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Should return is called")
        textField.resignFirstResponder()
        return true
    }
}

extension AddChecklistItemViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.textColor = UIColor.black
        if textView.text == placeholderDescriptionText {
            textView.text = ""
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty || textView.text == placeholderDescriptionText {
            textView.text = placeholderDescriptionText
            textView.textColor = .lightGray
        }
    }

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let isNewEnteredTextALineBreak = (text == "\n")
        if isNewEnteredTextALineBreak {
            textView.resignFirstResponder()
        }

        return true
    }
    
    func textViewDidChange(_ textView: UITextView) {
    }
    
}




