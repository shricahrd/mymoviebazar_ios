//  RegisterEmailID.swift
//  MyMovieBazar
//  Created by Apple on 8/13/20.
//  Copyright © 2020 rakesh. All rights reserved.

import UIKit

class RegisterEmailID: UIViewController {
    @IBOutlet weak var txtfldEmaiID: UITextField!
    @IBOutlet weak var btnSubmit: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtfldEmaiID.layer.cornerRadius = 3
        txtfldEmaiID.clipsToBounds = true
        txtfldEmaiID.layer.borderWidth = 1
        txtfldEmaiID.layer.borderColor = UIColor.lightGray.cgColor
        
        btnSubmit.layer.cornerRadius = 5
        btnSubmit.clipsToBounds = true
    }
    @IBAction func btnSubmit(_ sender: Any) {
    }
    
}
