//
//  DetailTableViewCell.swift
//  AnotherTableView_KL_Class
//
//  Created by Kevin Lopez on 4/19/18.
//  Copyright © 2018 io.ricoLabs. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var detailImageView: UIImageView!

    func configureWith(_ viewModel: DetailViewModel) {
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.description
        detailImageView.image = UIImage(named: viewModel.imageName)
    }
}
