//  MovietheatresListCell.swift
//  MyMovieBazar
//  Created by Apple on 8/14/20.
//  Copyright © 2020 rakesh. All rights reserved.

import UIKit

class MovietheatresListCell: UITableViewCell {

    @IBOutlet weak var maiviewBG: UIView!
    @IBOutlet weak var imgList: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAddresName: UILabel!
    @IBOutlet weak var imgRatting1: UIImageView!
    @IBOutlet weak var imgRatting2: UIImageView!
    @IBOutlet weak var imgRatting3: UIImageView!
    @IBOutlet weak var imgRatting4: UIImageView!
    @IBOutlet weak var imgRatting5: UIImageView!

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
