//
//  MyPlanCell.swift
//  MyMovieBazar
//
//  Created by RAKESH KUSHWAHA on 14/07/20.
//  Copyright © 2020 rakesh. All rights reserved.
//

import UIKit

class MyPlanCell: UITableViewCell {
    @IBOutlet var viewBg: UIView!
    @IBOutlet var planName: UILabel!
    @IBOutlet var date: UILabel!
    @IBOutlet var category: UILabel!
    @IBOutlet var price: UILabel!
    @IBOutlet var forLong: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
