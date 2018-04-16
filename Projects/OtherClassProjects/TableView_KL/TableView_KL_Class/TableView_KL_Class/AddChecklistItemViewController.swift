//
//  AddChecklistItemViewController.swift
//  TableView_KL_Class
//
//  Created by Kevin Lopez on 4/10/18.
//  Copyright © 2018 io.ricoLabs. All rights reserved.
//

import UIKit

protocol AddChecklistItemDelegate: class {
    func didPressSaveButton(_ item: ChecklistItem)
}

class AddChecklistItemViewController: UIViewController {
    
    var itemModel: ChecklistItem!
    
    weak var delegate: AddChecklistItemDelegate?
    
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
        configureNavigationBar()
        updateSaveButton()
    }
    
    private func configureNavigationBar() {
        title = "New Item"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonPressed))
        navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
    private func updateNameInModel(_ name: String) {
        itemModel.title = name
        updateSaveButton()
    }
    
    private func updateDescInModel(_ description: String) {
        itemModel.itemDescription = description
        updateSaveButton()
    }
    
    private func updateSaveButton() {
        navigationItem.rightBarButtonItem?.isEnabled = itemModel.isValid
    }
    
    @objc private func saveButtonPressed() {
        delegate?.didPressSaveButton(itemModel)
    }
}

extension AddChecklistItemViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Should return is called")
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let currentText = textField.text else {
            return false
        }
        
        let combinedText = (currentText as NSString).replacingCharacters(in: range, with: string)
       
        updateNameInModel(combinedText)
        
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
        if textView.text == placeholderDescriptionText {
            updateDescInModel("")
        } else {
            updateDescInModel(textView.text)
        }
    }
    
}




