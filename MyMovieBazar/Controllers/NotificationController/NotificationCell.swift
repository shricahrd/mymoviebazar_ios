//
//  NotificationCell.swift
//  MyMovieBazar
//
//  Created by RAKESH KUSHWAHA on 21/07/20.
//  Copyright © 2020 rakesh. All rights reserved.
//

import UIKit

class NotificationCell: UITableViewCell {
    @IBOutlet var viewBg: UIView!
    @IBOutlet var title: UILabel!
    @IBOutlet var hours: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
