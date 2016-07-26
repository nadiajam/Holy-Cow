//
//  FoodTableViewCell.swift
//  Holy-Cow
//
//  Created by Nadia Jamrozik on 7/26/16.
//  Copyright © 2016 Nadia Jamrozik. All rights reserved.
//

import UIKit

class FoodTableViewCell: UITableViewCell {

    @IBOutlet weak var customImage: UIImageView!
    @IBOutlet weak var customTitle: UILabel!
    @IBOutlet weak var customDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
