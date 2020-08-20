//  MovietheatresCell.swift
//  MyMovieBazar
//  Created by Apple on 8/12/20.
//  Copyright © 2020 rakesh. All rights reserved.

import UIKit

class MovietheatresCell: UITableViewCell {

    @IBOutlet weak var viewBG: UIView!
    @IBOutlet weak var btnselect: UIButton!
    @IBOutlet weak var lbltitale: UILabel!
    
    @IBOutlet weak var imgRatting: UIImageView!
    @IBOutlet weak var imgRatting1: UIImageView!
    @IBOutlet weak var imgRatting2: UIImageView!
    @IBOutlet weak var imgRatting3: UIImageView!
    @IBOutlet weak var imgRatting4: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func btnselect(_ sender: Any) {
    }
    
}
