//
//  ResetPassword.swift
//  MyMovieBazar
//
//  Created by Apple on 8/13/20.
//  Copyright © 2020 rakesh. All rights reserved.
//

import UIKit

class ResetPassword: UIViewController {
    @IBOutlet weak var txtfldPassword: UITextField!
    @IBOutlet weak var txtfldConfirmPassword: UITextField!
    @IBOutlet weak var btnUpdatePassword: UIButton!
    @IBOutlet weak var btnShowPassword: UIButton!
    @IBOutlet weak var btnShowConfirmPassword: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtfldPassword.layer.cornerRadius = 3
        txtfldPassword.clipsToBounds = true
        txtfldPassword.layer.borderWidth = 1
        txtfldPassword.layer.borderColor = UIColor.lightGray.cgColor
        
        txtfldConfirmPassword.layer.cornerRadius = 3
        txtfldConfirmPassword.clipsToBounds = true
        txtfldConfirmPassword.layer.borderWidth = 1
        txtfldConfirmPassword.layer.borderColor = UIColor.lightGray.cgColor
        
        btnUpdatePassword.layer.cornerRadius = 5
        btnUpdatePassword.clipsToBounds = true
        
        
    }
    @IBAction func btnUpdatePassword(_ sender: Any) {
    }
    @IBAction func btnShowPassword(_ sender: Any) {
    }
    @IBAction func btnShowConfirmPassword(_ sender: Any) {
    }
    
}

