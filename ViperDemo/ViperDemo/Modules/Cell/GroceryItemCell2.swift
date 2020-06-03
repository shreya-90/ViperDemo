//
//  GroceryItemCell2.swift
//  ViperDemo
//
//  Created by Shreya on 08/05/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import UIKit

class GroceryItemCell2: UITableViewCell {
    
    @IBOutlet weak var detailsLbl: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var productsImgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(using viewModel : GroceryItemViewModel) ->  Void {
        self.titleLabel.text = viewModel.title
        self.priceLabel.text = viewModel.price
        self.detailsLbl.text = viewModel.details
        self.productsImgView.image = UIImage(named: viewModel.image)
        
    }
}
