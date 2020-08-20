//  SelectTechnicianCell.swift
//  MyMovieBazar
//  Created by Apple on 8/13/20.
//  Copyright © 2020 rakesh. All rights reserved.

import UIKit

class SelectTechnicianCell: UITableViewCell {

    @IBOutlet weak var MainViewBG: UIView!
    @IBOutlet weak var btnSelect: UIButton!
    @IBOutlet weak var lblTital: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        MainViewBG.layer.cornerRadius = 2
        MainViewBG.clipsToBounds = true
        MainViewBG.layer.borderWidth = 0.5
        MainViewBG.layer.borderColor = UIColor.gray.cgColor
        MainViewBG.backgroundColor = .clear
        btnSelect.layer.cornerRadius = btnSelect.frame.size.width/2
        btnSelect.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
