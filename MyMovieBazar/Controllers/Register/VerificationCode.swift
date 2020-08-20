//  VerificationCode.swift
//  MyMovieBazar
//  Created by Apple on 8/13/20.
//  Copyright © 2020 rakesh. All rights reserved.

import UIKit

class VerificationCode: UIViewController {
    @IBOutlet weak var lblMessageNumber: UILabel!
    @IBOutlet weak var txtfldCode1: UITextField!
    @IBOutlet weak var txtfldCode2: UITextField!
    @IBOutlet weak var txtfldCode3: UITextField!
    @IBOutlet weak var txtfldCode4: UITextField!
    @IBOutlet weak var btnVerify: UIButton!
    @IBOutlet weak var lblTimer: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnVerify.layer.cornerRadius = 5
        btnVerify.clipsToBounds = true
        
        txtfldCode1.layer.cornerRadius = 3
        txtfldCode1.clipsToBounds = true
        txtfldCode1.layer.borderWidth = 1
        txtfldCode1.layer.borderColor = UIColor.lightGray.cgColor
        
        txtfldCode2.layer.cornerRadius = 3
        txtfldCode2.clipsToBounds = true
        txtfldCode2.layer.borderWidth = 1
        txtfldCode2.layer.borderColor = UIColor.lightGray.cgColor
        
        
        txtfldCode3.layer.cornerRadius = 3
        txtfldCode3.clipsToBounds = true
        txtfldCode3.layer.borderWidth = 1
        txtfldCode3.layer.borderColor = UIColor.lightGray.cgColor
        
        
        txtfldCode4.layer.cornerRadius = 3
        txtfldCode4.clipsToBounds = true
        txtfldCode4.layer.borderWidth = 1
        txtfldCode4.layer.borderColor = UIColor.lightGray.cgColor
        
        
        
        
        
    }
    @IBAction func btnVerifyCode(_ sender: Any) {
    }
    @IBAction func btnResendcode(_ sender: Any) {
    }
    
}
