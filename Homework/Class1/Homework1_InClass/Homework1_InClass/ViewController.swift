//
//  ViewController.swift
//  Homework1_InClass
//
//  Created by Kevin Lopez on 4/5/18.
//  Copyright © 2018 io.ricoLabs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var makerLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var carImageView: UIImageView!
    
    @IBOutlet var buttonList: [UIButton]!
    
    var dataModels = [Vehicle]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        configureButtons()
    }
    
    private func loadData() {
        dataModels = Vehicle.testData
    }
    
    private func configureButtons() {
        for i in 0..<buttonList.count {
            let button = buttonList[i]
            button.tag = i + 1
            let dataModel = dataModels[i]
            button.setTitle(dataModel.maker, for: .normal)
        }
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let indexOfButton = sender.tag - 1
        let dataModel = dataModels[indexOfButton]
        configureTopUI(dataModel)
    }
    
    private func configureTopUI(_ dataModel: Vehicle) {
        makerLabel.text = dataModel.maker
        modelLabel.text = dataModel.model
        priceLabel.text = dataModel.formattedPrice
        if let data = try? Data(contentsOf: dataModel.url) {
            carImageView.image = UIImage(data: data)
        }
    }
}

