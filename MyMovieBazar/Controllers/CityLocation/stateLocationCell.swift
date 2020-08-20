//
//  stateLocationCell.swift
//  MyMovieBazar
//
//  Created by Apple on 8/13/20.
//  Copyright © 2020 rakesh. All rights reserved.
//

import UIKit

class stateLocationCell: UITableViewCell {
    @IBOutlet weak var viewBG: UIView!
    @IBOutlet weak var btnselect: UIButton!
    @IBOutlet weak var lbltitale: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
