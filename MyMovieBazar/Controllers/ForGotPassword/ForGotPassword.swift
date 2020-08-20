//  ForGotPassword.swift
//  MyMovieBazar
//  Created by Apple on 8/13/20.
//  Copyright © 2020 rakesh. All rights reserved.

import UIKit

class ForGotPassword: UIViewController {

    @IBOutlet weak var txtfldEnterMobileNumber: UITextField!
    @IBOutlet weak var btnSendCode: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtfldEnterMobileNumber.layer.cornerRadius = 3
        txtfldEnterMobileNumber.clipsToBounds = true
        txtfldEnterMobileNumber.layer.borderWidth = 1
        txtfldEnterMobileNumber.layer.borderColor = UIColor.lightGray.cgColor
        
        btnSendCode.layer.cornerRadius = 5
        btnSendCode.clipsToBounds = true
        
        
    }

}
