//
//  DistributionListCell.swift
//  MyMovieBazar
//
//  Created by Apple on 8/14/20.
//  Copyright © 2020 rakesh. All rights reserved.
//

import UIKit

class DistributionListCell: UITableViewCell {

    @IBOutlet weak var MAINVIEWBG: UIView!
    
    @IBOutlet weak var IMGLIST: UIImageView!
    
    @IBOutlet weak var btnLike: UIButton!
    @IBOutlet weak var lblLike: UILabel!
    @IBOutlet weak var btnEye: UIButton!
    @IBOutlet weak var lblEye: UILabel!
    @IBOutlet weak var lblMovieName: UILabel!
    @IBOutlet weak var lblMovieName1: UILabel!
    @IBOutlet weak var lblLanguage: UILabel!
    @IBOutlet weak var lblLanguage1: UILabel!
    @IBOutlet weak var btnMoreDetails: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        btnMoreDetails.layer.cornerRadius = 2
        btnMoreDetails.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
