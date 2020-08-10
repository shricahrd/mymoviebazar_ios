//  OffersCell.swift
//  MyMovieBazar
//  Created by RAKESH KUSHWAHA on 21/07/20.
//  Copyright © 2020 rakesh. All rights reserved.


import UIKit
class OffersCell: UITableViewCell {
    @IBOutlet var viewBg: UIView!
    @IBOutlet var promocode: UILabel!
    @IBOutlet var flatoff: UILabel!
    @IBOutlet var validity: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
