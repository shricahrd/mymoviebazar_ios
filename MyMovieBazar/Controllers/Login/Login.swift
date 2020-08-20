//  Login.swift
//  MyMovieBazar
//  Created by Apple on 8/13/20.
//  Copyright © 2020 rakesh. All rights reserved.

import UIKit

class Login: UIViewController {
    @IBOutlet weak var txtfldMobileNumber: UITextField!
    @IBOutlet weak var txtfldPassword: UITextField!
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var btnForgotPassword: UIButton!
    @IBOutlet weak var btnShowPassword: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnSubmit.layer.cornerRadius = 5
        btnSubmit.clipsToBounds = true
        
        txtfldMobileNumber.layer.cornerRadius = 3
        txtfldMobileNumber.clipsToBounds = true
        txtfldMobileNumber.layer.borderWidth = 1
        txtfldMobileNumber.layer.borderColor = UIColor.lightGray.cgColor
        
        txtfldPassword.layer.cornerRadius = 3
        txtfldPassword.clipsToBounds = true
        txtfldPassword.layer.borderWidth = 1
        txtfldPassword.layer.borderColor = UIColor.lightGray.cgColor
    }


    @IBAction func btnShowPassword(_ sender: Any) {
    }
    @IBAction func btnSubmit(_ sender: Any) {
    }
    @IBAction func btnForgotPassword(_ sender: Any) {
    }
}
