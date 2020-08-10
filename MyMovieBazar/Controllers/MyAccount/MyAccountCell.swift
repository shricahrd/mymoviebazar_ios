//  MyAccountCell.swift
//  MyMovieBazar
//  Created by RAKESH KUSHWAHA on 14/07/20.
//  Copyright © 2020 rakesh. All rights reserved.

import UIKit

class MyAccountCell: UITableViewCell {
    @IBOutlet var viewBg: UIView!
    @IBOutlet var imageIcons: UIImageView!
    @IBOutlet var name: UILabel!
    
    @IBOutlet var radioButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
