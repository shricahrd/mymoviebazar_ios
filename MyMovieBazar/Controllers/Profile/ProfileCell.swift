//  ProfileCell.swift
//  MyMovieBazar
//  Created by Apple on 8/12/20.
//  Copyright © 2020 rakesh. All rights reserved.

import UIKit

class ProfileCell: UITableViewCell {

    @IBOutlet weak var viewBG: UIView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblName1: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
