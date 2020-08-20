//  EnterYourDetail.swift
//  MyMovieBazar
//  Created by Apple on 8/13/20.
//  Copyright © 2020 rakesh. All rights reserved.

import UIKit

class EnterYourDetail: UIViewController, UIScrollViewDelegate, UITextFieldDelegate, UITextViewDelegate {
    @IBOutlet weak var viewBg: UIView!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var lblTital: UILabel!
    @IBOutlet weak var btnLocation: UIButton!
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var btnNotification: UIButton!
    
    var scrollViewMain: UIScrollView!
    var viewAccountBG: UIView!
    var textFieldName: UITextField!
    var viewWithdrawalBG: UIView!
    var textFieldWithdrwalAmount: UITextField!
    var lanGuageview: UIView!
    var contactView: UIView!
    var contactTextField = UITextField()
    var emailView: UIView!
    var emailTextField = UITextField()
    var addressView: UIView!
    var addressTextField = UITextField()
    var areaPincodeView: UIView!
    var areaPincodeTextField = UITextField()
    var cityView: UIView!
    var cityTextField = UITextField()
    var stateView: UIView!
    var stateTextField = UITextField()
    var gstNoView: UIView!
    var gstTextField = UITextField()
    var idProofView: UIView!
    var referalIDView: UIView!
    var referalIDTextField = UITextField()
    var accountNameTextField = UITextField()
    var amountTextField = UITextField()
    var bankNameTextField = UITextField()
    var screenSize: CGRect = UIScreen.main.bounds
    var screenWidth:CGFloat = 0.0
    var screenHeight:CGFloat = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        view.backgroundColor = UIColor(red:255.0/255.0, green:255.0/255.0, blue:255.0/255.0, alpha:1.0)
        screenWidth = screenSize.width
        screenHeight = screenSize.height

        self.uiSetUp()
    }
    
    func uiSetUp() {
        scrollViewMain = UIScrollView()
        scrollViewMain.frame = CGRect(x: 0, y:80, width: screenWidth, height: screenHeight-80)
        scrollViewMain.bounces=true
        scrollViewMain.delegate=self
        scrollViewMain.backgroundColor=UIColor.clear
        scrollViewMain.isScrollEnabled = true
        scrollViewMain.clipsToBounds = true
        viewBg.addSubview(scrollViewMain)
        


        viewAccountBG = UIView()
        viewAccountBG.frame = CGRect(x: 16, y:5, width: screenWidth-32, height: 100)
        viewAccountBG.backgroundColor = UIColor(red:239.0/255.0, green:239.0/255.0, blue:239.0/255.0, alpha:1.0)
        viewAccountBG.backgroundColor = UIColor.white
        viewAccountBG.isUserInteractionEnabled = true
        viewAccountBG.layer.borderWidth = 0.4
        viewAccountBG.layer.borderColor = UIColor.lightGray.cgColor
        viewAccountBG.layer.cornerRadius = 6.0
        scrollViewMain.addSubview(viewAccountBG)
        
        let Name: UILabel! = UILabel()
        Name.frame = CGRect(x: 16, y: 4, width: viewAccountBG.frame.size.width - 32 , height: 30)
        Name.text = "Name"
        Name.numberOfLines = 1
        Name.backgroundColor = .clear
        Name.textAlignment = .left
        Name.textColor = .darkGray
        Name.font = UIFont(name: Name.font.fontName, size: 15)
        viewAccountBG.addSubview(Name)
        
        let paddingL: UIView = UIView()
        paddingL.frame = CGRect(x: 0, y: 0,width: 0, height: 10)
        accountNameTextField.frame = CGRect(x: 16, y: Name.frame.maxY, width: viewAccountBG.frame.size.width - 32 , height: 30)
        accountNameTextField.delegate = self
        accountNameTextField.layer.borderColor =  UIColor(red: 215.0/255.0, green: 215.0/255.0, blue: 215.0/255.0, alpha: 1).cgColor
        accountNameTextField.textColor = UIColor.black
        accountNameTextField.leftView = paddingL
        accountNameTextField.rightView = paddingL
        accountNameTextField.placeholder = "Type Here"
        accountNameTextField.tintColor = UIColor.black;
        accountNameTextField.font = UIFont(name: "Arial",size: 11)
        accountNameTextField.backgroundColor = UIColor.white
        accountNameTextField.layer.cornerRadius = 0
        accountNameTextField.leftViewMode = .always
        accountNameTextField.rightViewMode = .always
        viewAccountBG.addSubview(accountNameTextField)

        let viewUnline = UIView()
        viewUnline.frame = CGRect(x: 16, y:accountNameTextField.frame.maxY+1, width: viewAccountBG.frame.size.width-32, height: 1)
        viewUnline.backgroundColor = UIColor(red:239.0/255.0, green:239.0/255.0, blue:239.0/255.0, alpha:1.0)
        viewAccountBG.addSubview(viewUnline)
        
        viewWithdrawalBG = UIView()
        viewWithdrawalBG.frame = CGRect(x: 16, y:viewAccountBG.frame.maxY+20, width: screenWidth-32, height: 100)
        viewWithdrawalBG.backgroundColor = UIColor(red:239.0/255.0, green:239.0/255.0, blue:239.0/255.0, alpha:1.0)
        viewWithdrawalBG.backgroundColor = UIColor.white
        viewWithdrawalBG.isUserInteractionEnabled = true
        viewWithdrawalBG.layer.borderWidth = 0.4
        viewWithdrawalBG.layer.borderColor = UIColor.lightGray.cgColor
        viewWithdrawalBG.layer.cornerRadius = 6.0
        scrollViewMain.addSubview(viewWithdrawalBG)
        
        let withdrawalAmount: UILabel! = UILabel()
        withdrawalAmount.frame = CGRect(x: 16, y: 4, width: viewAccountBG.frame.size.width - 32 , height: 30)
        withdrawalAmount.text = "Profession"
        withdrawalAmount.numberOfLines = 1
        withdrawalAmount.backgroundColor = .clear
        withdrawalAmount.textAlignment = .left
        withdrawalAmount.textColor = .darkGray
        withdrawalAmount.font = UIFont(name: withdrawalAmount.font.fontName, size: 15)
        viewWithdrawalBG.addSubview(withdrawalAmount)
        
        let paddingamountTextFieldL: UIView = UIView()
         paddingamountTextFieldL.frame = CGRect(x: 0, y: 0,width: 0, height: 10)
         
         amountTextField.frame = CGRect(x: 16, y: withdrawalAmount.frame.maxY+1, width: viewAccountBG.frame.size.width - 32 , height: 30)
         amountTextField.delegate = self
         amountTextField.layer.borderColor =  UIColor(red: 215.0/255.0, green: 215.0/255.0, blue: 215.0/255.0, alpha: 1).cgColor
         amountTextField.textColor = UIColor.black
         amountTextField.leftView = paddingamountTextFieldL
         amountTextField.rightView = paddingamountTextFieldL
         amountTextField.placeholder = "Type Here"
         amountTextField.tintColor = UIColor.black;
         amountTextField.font = UIFont(name: "Arial",size: 11)
         amountTextField.backgroundColor = UIColor.white
         amountTextField.layer.cornerRadius = 0
         amountTextField.leftViewMode = .always
         amountTextField.rightViewMode = .always
         viewWithdrawalBG.addSubview(amountTextField)
        
        
        let viewwithdrawalAmountUnline = UIView()
        viewwithdrawalAmountUnline.frame = CGRect(x: 16, y:withdrawalAmount.frame.maxY+40, width: viewWithdrawalBG.frame.size.width-32, height: 1)
        viewwithdrawalAmountUnline.backgroundColor = UIColor(red:239.0/255.0, green:239.0/255.0, blue:239.0/255.0, alpha:1.0)
        viewWithdrawalBG.addSubview(viewwithdrawalAmountUnline)
        
        let lanGuage: UILabel! = UILabel()
        lanGuage.frame = CGRect(x: 16, y: viewWithdrawalBG.frame.maxY+10, width: screenWidth - 32 , height: 30)
        lanGuage.text = "Language"
        lanGuage.numberOfLines = 1
        lanGuage.backgroundColor = .clear
        lanGuage.textAlignment = .left
        lanGuage.textColor = .darkGray
        lanGuage.font = UIFont(name: lanGuage.font.fontName, size: 15)
        scrollViewMain.addSubview(lanGuage)
        
        lanGuageview = UIView()
        lanGuageview.frame = CGRect(x: 16, y:lanGuage.frame.maxY+5, width: screenWidth-32, height: 50)
        lanGuageview.backgroundColor = UIColor(red:239.0/255.0, green:239.0/255.0, blue:239.0/255.0, alpha:1.0)
        lanGuageview.backgroundColor = UIColor.white
        lanGuageview.isUserInteractionEnabled = true
        lanGuageview.layer.borderWidth = 0.4
        lanGuageview.layer.borderColor = UIColor.lightGray.cgColor
        lanGuageview.layer.cornerRadius = 6.0
        scrollViewMain.addSubview(lanGuageview)
        
        let lanGuage18: UILabel! = UILabel()
        lanGuage18.frame = CGRect(x: 16, y:0, width:lanGuageview.frame.size.width/2 , height: 50)
        lanGuage18.text = "18 Language"
        lanGuage18.numberOfLines = 1
        lanGuage18.backgroundColor = .clear
        lanGuage18.textAlignment = .left
        lanGuage18.textColor = .darkGray
        lanGuage18.font = UIFont(name: lanGuage18.font.fontName, size: 15)
        lanGuageview.addSubview(lanGuage18)
        
        let btnLanguage = UIButton()
        btnLanguage.frame = CGRect(x: lanGuageview.frame.size.width-40, y:15, width:20, height: 20)
        btnLanguage.setTitle("", for: .normal)
        btnLanguage.setTitleColor(.white, for: .normal)
        btnLanguage.titleLabel?.textAlignment = .center
        btnLanguage.backgroundColor = UIColor.red
        btnLanguage.layer.cornerRadius = 0
        btnLanguage.clipsToBounds = true
        btnLanguage.addTarget(self, action: #selector(self.btnLanguage), for: .touchUpInside)
        lanGuageview.addSubview(btnLanguage)

        
        contactView = UIView()
        contactView.frame = CGRect(x: 16, y:lanGuageview.frame.maxY+20, width: screenWidth-32, height: 100)
        contactView.backgroundColor = UIColor(red:239.0/255.0, green:239.0/255.0, blue:239.0/255.0, alpha:1.0)
        contactView.backgroundColor = UIColor.white
        contactView.isUserInteractionEnabled = true
        contactView.layer.borderWidth = 0.4
        contactView.layer.borderColor = UIColor.lightGray.cgColor
        contactView.layer.cornerRadius = 6.0
        scrollViewMain.addSubview(contactView)

        let Contact: UILabel! = UILabel()
        Contact.frame = CGRect(x: 16, y: 4, width: lanGuageview.frame.size.width - 32 , height: 30)
        Contact.text = "Contact"
        Contact.numberOfLines = 1
        Contact.backgroundColor = .clear
        Contact.textAlignment = .left
        Contact.textColor = .darkGray
        Contact.font = UIFont(name: Contact.font.fontName, size: 15)
        contactView.addSubview(Contact)

        let paddingcontactTextField: UIView = UIView()
        paddingcontactTextField.frame = CGRect(x: 0, y: 0,width: 0, height: 10)
         contactTextField.frame = CGRect(x: 16, y: Contact.frame.maxY, width: contactView.frame.size.width - 32 , height: 30)
         contactTextField.delegate = self
         contactTextField.layer.borderColor =  UIColor(red: 215.0/255.0, green: 215.0/255.0, blue: 215.0/255.0, alpha: 1).cgColor
         contactTextField.textColor = UIColor.black
         contactTextField.leftView = paddingcontactTextField
         contactTextField.rightView = paddingcontactTextField
         contactTextField.placeholder = "Type Here"
         contactTextField.tintColor = UIColor.black;
         contactTextField.font = UIFont(name: "Arial",size: 11)
         contactTextField.backgroundColor = UIColor.white
         contactTextField.layer.cornerRadius = 0
         contactTextField.leftViewMode = .always
         contactTextField.rightViewMode = .always
         contactView.addSubview(contactTextField)

        let viewBankNameUnline = UIView()
        viewBankNameUnline.frame = CGRect(x: 16, y:contactTextField.frame.maxY+1, width: contactView.frame.size.width-32, height: 1)
        viewBankNameUnline.backgroundColor = UIColor(red:239.0/255.0, green:239.0/255.0, blue:239.0/255.0, alpha:1.0)
        contactView.addSubview(viewBankNameUnline)
        
        //
        emailView = UIView()
        emailView.frame = CGRect(x: 16, y:contactView.frame.maxY+20, width: screenWidth-32, height: 100)
        emailView.backgroundColor = UIColor(red:239.0/255.0, green:239.0/255.0, blue:239.0/255.0, alpha:1.0)
        emailView.backgroundColor = UIColor.white
        emailView.isUserInteractionEnabled = true
        emailView.layer.borderWidth = 0.4
        emailView.layer.borderColor = UIColor.lightGray.cgColor
        emailView.layer.cornerRadius = 6.0
        scrollViewMain.addSubview(emailView)

        let lblEmail: UILabel! = UILabel()
        lblEmail.frame = CGRect(x: 16, y: 4, width: emailView.frame.size.width - 32 , height: 30)
        lblEmail.text = "Email Id"
        lblEmail.numberOfLines = 1
        lblEmail.backgroundColor = .clear
        lblEmail.textAlignment = .left
        lblEmail.textColor = .darkGray
        lblEmail.font = UIFont(name: lblEmail.font.fontName, size: 15)
        emailView.addSubview(lblEmail)

        let paddingEmailIdTextField: UIView = UIView()
        paddingEmailIdTextField.frame = CGRect(x: 0, y: 0,width: 0, height: 10)
        emailTextField.frame = CGRect(x: 16, y: lblEmail.frame.maxY, width: emailView.frame.size.width - 32 , height: 30)
        emailTextField.delegate = self
        emailTextField.layer.borderColor =  UIColor(red: 215.0/255.0, green: 215.0/255.0, blue: 215.0/255.0, alpha: 1).cgColor
        emailTextField.textColor = UIColor.black
        emailTextField.leftView = paddingEmailIdTextField
        emailTextField.rightView = paddingEmailIdTextField
        emailTextField.placeholder = "Type Here"
        emailTextField.tintColor = UIColor.black;
        emailTextField.font = UIFont(name: "Arial",size: 11)
        emailTextField.backgroundColor = UIColor.white
        emailTextField.layer.cornerRadius = 0
        emailTextField.leftViewMode = .always
        emailTextField.rightViewMode = .always
        emailView.addSubview(emailTextField)

        let viewEmailUnline = UIView()
        viewEmailUnline.frame = CGRect(x: 16, y:emailTextField.frame.maxY+1, width: emailView.frame.size.width-32, height: 1)
        viewEmailUnline.backgroundColor = UIColor(red:239.0/255.0, green:239.0/255.0, blue:239.0/255.0, alpha:1.0)
        emailView.addSubview(viewEmailUnline)
        
        //
        addressView = UIView()
        addressView.frame = CGRect(x: 16, y:emailView.frame.maxY+20, width: screenWidth-32, height: 100)
        addressView.backgroundColor = UIColor(red:239.0/255.0, green:239.0/255.0, blue:239.0/255.0, alpha:1.0)
        addressView.backgroundColor = UIColor.white
        addressView.isUserInteractionEnabled = true
        addressView.layer.borderWidth = 0.4
        addressView.layer.borderColor = UIColor.lightGray.cgColor
        addressView.layer.cornerRadius = 6.0
        scrollViewMain.addSubview(addressView)

        let lblAddress: UILabel! = UILabel()
        lblAddress.frame = CGRect(x: 16, y: 4, width: addressView.frame.size.width - 32 , height: 30)
        lblAddress.text = "Address"
        lblAddress.numberOfLines = 1
        lblAddress.backgroundColor = .clear
        lblAddress.textAlignment = .left
        lblAddress.textColor = .darkGray
        lblAddress.font = UIFont(name: lblAddress.font.fontName, size: 15)
        addressView.addSubview(lblAddress)

        let paddingaddressTextField: UIView = UIView()
        paddingaddressTextField.frame = CGRect(x: 0, y: 0,width: 0, height: 10)
        addressTextField.frame = CGRect(x: 16, y: lblAddress.frame.maxY, width: addressView.frame.size.width - 32 , height: 30)
        addressTextField.delegate = self
        addressTextField.layer.borderColor =  UIColor(red: 215.0/255.0, green: 215.0/255.0, blue: 215.0/255.0, alpha: 1).cgColor
        addressTextField.textColor = UIColor.black
        addressTextField.leftView = paddingaddressTextField
        addressTextField.rightView = paddingaddressTextField
        addressTextField.placeholder = "Type Here"
        addressTextField.tintColor = UIColor.black;
        addressTextField.font = UIFont(name: "Arial",size: 11)
        addressTextField.backgroundColor = UIColor.white
        addressTextField.layer.cornerRadius = 0
        addressTextField.leftViewMode = .always
        addressTextField.rightViewMode = .always
        addressView.addSubview(addressTextField)

        let viewAddressUnline = UIView()
        viewAddressUnline.frame = CGRect(x: 16, y:addressTextField.frame.maxY+1, width: addressView.frame.size.width-32, height: 1)
        viewAddressUnline.backgroundColor = UIColor(red:239.0/255.0, green:239.0/255.0, blue:239.0/255.0, alpha:1.0)
        addressView.addSubview(viewAddressUnline)
            
            //
        areaPincodeView = UIView()
        areaPincodeView.frame = CGRect(x: 16, y:addressView.frame.maxY+20, width: screenWidth-32, height: 100)
        areaPincodeView.backgroundColor = UIColor(red:239.0/255.0, green:239.0/255.0, blue:239.0/255.0, alpha:1.0)
        areaPincodeView.backgroundColor = UIColor.white
        areaPincodeView.isUserInteractionEnabled = true
        areaPincodeView.layer.borderWidth = 0.4
        areaPincodeView.layer.borderColor = UIColor.lightGray.cgColor
        areaPincodeView.layer.cornerRadius = 6.0
        scrollViewMain.addSubview(areaPincodeView)

        let lblAreaPincode: UILabel! = UILabel()
        lblAreaPincode.frame = CGRect(x: 16, y: 4, width: areaPincodeView.frame.size.width - 32 , height: 30)
        lblAreaPincode.text = "Area Pincode"
        lblAreaPincode.numberOfLines = 1
        lblAreaPincode.backgroundColor = .clear
        lblAreaPincode.textAlignment = .left
        lblAreaPincode.textColor = .darkGray
        lblAreaPincode.font = UIFont(name: lblAreaPincode.font.fontName, size: 15)
        areaPincodeView.addSubview(lblAreaPincode)

        let paddingAreaPincodeTextField: UIView = UIView()
        paddingAreaPincodeTextField.frame = CGRect(x: 0, y: 0,width: 0, height: 10)
        areaPincodeTextField.frame = CGRect(x: 16, y: lblAreaPincode.frame.maxY, width: areaPincodeView.frame.size.width - 32 , height: 30)
        areaPincodeTextField.delegate = self
        areaPincodeTextField.layer.borderColor =  UIColor(red: 215.0/255.0, green: 215.0/255.0, blue: 215.0/255.0, alpha: 1).cgColor
        areaPincodeTextField.textColor = UIColor.black
        areaPincodeTextField.leftView = paddingAreaPincodeTextField
        areaPincodeTextField.rightView = paddingAreaPincodeTextField
        areaPincodeTextField.placeholder = "Type Here"
        areaPincodeTextField.tintColor = UIColor.black;
        areaPincodeTextField.font = UIFont(name: "Arial",size: 11)
        areaPincodeTextField.backgroundColor = UIColor.white
        areaPincodeTextField.layer.cornerRadius = 0
        areaPincodeTextField.leftViewMode = .always
        areaPincodeTextField.rightViewMode = .always
        areaPincodeView.addSubview(areaPincodeTextField)

        let viewAreaPincodeUnline = UIView()
        viewAreaPincodeUnline.frame = CGRect(x: 16, y:areaPincodeTextField.frame.maxY+1, width: areaPincodeView.frame.size.width-32, height: 1)
        viewAreaPincodeUnline.backgroundColor = UIColor(red:239.0/255.0, green:239.0/255.0, blue:239.0/255.0, alpha:1.0)
        areaPincodeView.addSubview(viewAreaPincodeUnline)
                
        
        //
        cityView = UIView()
        cityView.frame = CGRect(x: 16, y:areaPincodeView.frame.maxY+20, width: screenWidth-32, height: 100)
        cityView.backgroundColor = UIColor(red:239.0/255.0, green:239.0/255.0, blue:239.0/255.0, alpha:1.0)
        cityView.backgroundColor = UIColor.white
        cityView.isUserInteractionEnabled = true
        cityView.layer.borderWidth = 0.4
        cityView.layer.borderColor = UIColor.lightGray.cgColor
        cityView.layer.cornerRadius = 6.0
        scrollViewMain.addSubview(cityView)

        let lblCity: UILabel! = UILabel()
        lblCity.frame = CGRect(x: 16, y: 4, width: cityView.frame.size.width - 32 , height: 30)
        lblCity.text = "City"
        lblCity.numberOfLines = 1
        lblCity.backgroundColor = .clear
        lblCity.textAlignment = .left
        lblCity.textColor = .darkGray
        lblCity.font = UIFont(name: lblCity.font.fontName, size: 15)
        cityView.addSubview(lblCity)

        let paddingCityTextField: UIView = UIView()
        paddingCityTextField.frame = CGRect(x: 0, y: 0,width: 0, height: 10)
        cityTextField.frame = CGRect(x: 16, y: lblCity.frame.maxY, width: cityView.frame.size.width - 32 , height: 30)
        cityTextField.delegate = self
        cityTextField.layer.borderColor =  UIColor(red: 215.0/255.0, green: 215.0/255.0, blue: 215.0/255.0, alpha: 1).cgColor
        cityTextField.textColor = UIColor.black
        cityTextField.leftView = paddingCityTextField
        cityTextField.rightView = paddingCityTextField
        cityTextField.placeholder = "Type Here"
        cityTextField.tintColor = UIColor.black;
        cityTextField.font = UIFont(name: "Arial",size: 11)
        cityTextField.backgroundColor = UIColor.white
        cityTextField.layer.cornerRadius = 0
        cityTextField.leftViewMode = .always
        cityTextField.rightViewMode = .always
        cityView.addSubview(cityTextField)

        let viewCityUnline = UIView()
        viewCityUnline.frame = CGRect(x: 16, y:cityTextField.frame.maxY+1, width: cityView.frame.size.width-32, height: 1)
        viewCityUnline.backgroundColor = UIColor(red:239.0/255.0, green:239.0/255.0, blue:239.0/255.0, alpha:1.0)
        cityView.addSubview(viewCityUnline)
  //
        let lblState: UILabel! = UILabel()
        lblState.frame = CGRect(x: 16, y: cityView.frame.maxY+10, width: screenWidth - 32 , height: 30)
        lblState.text = "State"
        lblState.numberOfLines = 1
        lblState.backgroundColor = .clear
        lblState.textAlignment = .left
        lblState.textColor = .darkGray
        lblState.font = UIFont(name: lblState.font.fontName, size: 15)
        scrollViewMain.addSubview(lblState)
        
        stateView = UIView()
        stateView.frame = CGRect(x: 16, y:lblState.frame.maxY+5, width: screenWidth-32, height: 50)
        stateView.backgroundColor = UIColor(red:239.0/255.0, green:239.0/255.0, blue:239.0/255.0, alpha:1.0)
        stateView.backgroundColor = UIColor.white
        stateView.isUserInteractionEnabled = true
        stateView.layer.borderWidth = 0.4
        stateView.layer.borderColor = UIColor.lightGray.cgColor
        stateView.layer.cornerRadius = 6.0
        scrollViewMain.addSubview(stateView)
        
        let lblSelect: UILabel! = UILabel()
        lblSelect.frame = CGRect(x: 16, y:0, width:stateView.frame.size.width/2 , height: 50)
        lblSelect.text = "Select"
        lblSelect.numberOfLines = 1
        lblSelect.backgroundColor = .clear
        lblSelect.textAlignment = .left
        lblSelect.textColor = .darkGray
        lblSelect.font = UIFont(name: lblSelect.font.fontName, size: 15)
        stateView.addSubview(lblSelect)
        
        let btnDropState = UIButton()
        btnDropState.frame = CGRect(x: stateView.frame.size.width-40, y:15, width:20, height: 20)
        btnDropState.setTitle("", for: .normal)
        btnDropState.setTitleColor(.white, for: .normal)
        btnDropState.titleLabel?.textAlignment = .center
        btnDropState.backgroundColor = UIColor.red
        btnDropState.layer.cornerRadius = 0
        btnDropState.clipsToBounds = true
        btnDropState.addTarget(self, action: #selector(self.btnDropState), for: .touchUpInside)
        stateView.addSubview(btnDropState)

        //
        gstNoView = UIView()
        gstNoView.frame = CGRect(x: 16, y:stateView.frame.maxY+20, width: screenWidth-32, height: 100)
        gstNoView.backgroundColor = UIColor(red:239.0/255.0, green:239.0/255.0, blue:239.0/255.0, alpha:1.0)
        gstNoView.backgroundColor = UIColor.white
        gstNoView.isUserInteractionEnabled = true
        gstNoView.layer.borderWidth = 0.4
        gstNoView.layer.borderColor = UIColor.lightGray.cgColor
        gstNoView.layer.cornerRadius = 6.0
        scrollViewMain.addSubview(gstNoView)

        let lblGst: UILabel! = UILabel()
        lblGst.frame = CGRect(x: 16, y: 4, width: gstNoView.frame.size.width - 32 , height: 30)
        lblGst.text = "GSTNo.(optional)"
        lblGst.numberOfLines = 1
        lblGst.backgroundColor = .clear
        lblGst.textAlignment = .left
        lblGst.textColor = .darkGray
        lblGst.font = UIFont(name: lblGst.font.fontName, size: 15)
        gstNoView.addSubview(lblGst)

        let paddingGstTextField: UIView = UIView()
        paddingGstTextField.frame = CGRect(x: 0, y: 0,width: 0, height: 10)
        gstTextField.frame = CGRect(x: 16, y: lblGst.frame.maxY, width: gstNoView.frame.size.width - 32 , height: 30)
        gstTextField.delegate = self
        gstTextField.layer.borderColor =  UIColor(red: 215.0/255.0, green: 215.0/255.0, blue: 215.0/255.0, alpha: 1).cgColor
        gstTextField.textColor = UIColor.black
        gstTextField.leftView = paddingGstTextField
        gstTextField.rightView = paddingGstTextField
        gstTextField.placeholder = "Type Here"
        gstTextField.tintColor = UIColor.black;
        gstTextField.font = UIFont(name: "Arial",size: 11)
        gstTextField.backgroundColor = UIColor.white
        gstTextField.layer.cornerRadius = 0
        gstTextField.leftViewMode = .always
        gstTextField.rightViewMode = .always
        gstNoView.addSubview(gstTextField)

        let viewGstUnline = UIView()
        viewGstUnline.frame = CGRect(x: 16, y:gstTextField.frame.maxY+1, width: gstNoView.frame.size.width-32, height: 1)
        viewGstUnline.backgroundColor = UIColor(red:239.0/255.0, green:239.0/255.0, blue:239.0/255.0, alpha:1.0)
        gstNoView.addSubview(viewGstUnline)
        
        idProofView = UIView()
        idProofView.frame = CGRect(x: 16, y:gstNoView.frame.maxY+20, width: screenWidth-32, height: 50)
        idProofView.backgroundColor = UIColor(red:239.0/255.0, green:239.0/255.0, blue:239.0/255.0, alpha:1.0)
        idProofView.backgroundColor = UIColor.white
        idProofView.isUserInteractionEnabled = true
        idProofView.layer.borderWidth = 0.4
        idProofView.layer.borderColor = UIColor.lightGray.cgColor
        idProofView.layer.cornerRadius = 6.0
        scrollViewMain.addSubview(idProofView)

        let lblIdProof: UILabel! = UILabel()
        lblIdProof.frame = CGRect(x: 16, y:0, width:idProofView.frame.size.width/2 , height: 50)
        lblIdProof.text = "ID Proof"
        lblIdProof.numberOfLines = 1
        lblIdProof.backgroundColor = .clear
        lblIdProof.textAlignment = .left
        lblIdProof.textColor = .darkGray
        lblIdProof.font = UIFont(name: lblIdProof.font.fontName, size: 15)
        idProofView.addSubview(lblIdProof)

        let btnDropIdProof = UIButton()
        btnDropIdProof.frame = CGRect(x: idProofView.frame.size.width-40, y:15, width:20, height: 20)
        btnDropIdProof.setTitle("", for: .normal)
        btnDropIdProof.setTitleColor(.white, for: .normal)
        btnDropIdProof.titleLabel?.textAlignment = .center
        btnDropIdProof.backgroundColor = UIColor.red
        btnDropIdProof.layer.cornerRadius = 0
        btnDropIdProof.clipsToBounds = true
        btnDropIdProof.addTarget(self, action: #selector(self.btnDropIdProof), for: .touchUpInside)
        idProofView.addSubview(btnDropIdProof)
        //
        referalIDView = UIView()
        referalIDView.frame = CGRect(x: 16, y:idProofView.frame.maxY+20, width: screenWidth-32, height: 100)
        referalIDView.backgroundColor = UIColor(red:239.0/255.0, green:239.0/255.0, blue:239.0/255.0, alpha:1.0)
        referalIDView.backgroundColor = UIColor.white
        referalIDView.isUserInteractionEnabled = true
        referalIDView.layer.borderWidth = 0.4
        referalIDView.layer.borderColor = UIColor.lightGray.cgColor
        referalIDView.layer.cornerRadius = 6.0
        scrollViewMain.addSubview(referalIDView)

        let lblReferalID: UILabel! = UILabel()
        lblReferalID.frame = CGRect(x: 16, y: 4, width: referalIDView.frame.size.width - 32 , height: 30)
        lblReferalID.text = "Referal ID"
        lblReferalID.numberOfLines = 1
        lblReferalID.backgroundColor = .clear
        lblReferalID.textAlignment = .left
        lblReferalID.textColor = .darkGray
        lblReferalID.font = UIFont(name: lblReferalID.font.fontName, size: 15)
        referalIDView.addSubview(lblReferalID)

        let paddingReferalIDTextField: UIView = UIView()
        paddingReferalIDTextField.frame = CGRect(x: 0, y: 0,width: 0, height: 10)
        referalIDTextField.frame = CGRect(x: 16, y: lblGst.frame.maxY, width: referalIDView.frame.size.width - 32 , height: 30)
        referalIDTextField.delegate = self
        referalIDTextField.layer.borderColor =  UIColor(red: 215.0/255.0, green: 215.0/255.0, blue: 215.0/255.0, alpha: 1).cgColor
        referalIDTextField.textColor = UIColor.black
        referalIDTextField.leftView = paddingReferalIDTextField
        referalIDTextField.rightView = paddingReferalIDTextField
        referalIDTextField.placeholder = "Type Here"
        referalIDTextField.tintColor = UIColor.black;
        referalIDTextField.font = UIFont(name: "Arial",size: 11)
        referalIDTextField.backgroundColor = UIColor.white
        referalIDTextField.layer.cornerRadius = 0
        referalIDTextField.leftViewMode = .always
        referalIDTextField.rightViewMode = .always
        referalIDView.addSubview(referalIDTextField)
     
        let viewReferalIdUnline = UIView()
        viewReferalIdUnline.frame = CGRect(x: 16, y:referalIDTextField.frame.maxY+1, width: referalIDView.frame.size.width-32, height: 1)
        viewReferalIdUnline.backgroundColor = UIColor(red:239.0/255.0, green:239.0/255.0, blue:239.0/255.0, alpha:1.0)
        referalIDView.addSubview(viewReferalIdUnline)
        
        let btnProceed = UIButton()
        btnProceed.frame = CGRect(x: 16, y:referalIDView.frame.maxY+20, width:screenWidth-32, height: 45)
        btnProceed.setTitle("PROCEED", for: .normal)
        btnProceed.setTitleColor(.white, for: .normal)
        btnProceed.titleLabel?.textAlignment = .center
        btnProceed.backgroundColor = UIColor.red
        btnProceed.layer.cornerRadius = 8
        btnProceed.clipsToBounds = true
        btnProceed.addTarget(self, action: #selector(self.btnProceed), for: .touchUpInside)
        scrollViewMain.addSubview(btnProceed)

        scrollViewMain.contentSize = CGSize(width: 0, height: btnProceed.frame.maxY + 400)
        scrollViewMain.keyboardDismissMode = .interactive
    }
    @objc func btnProceed() {
    }
    @objc func btnDropIdProof() {
           
    }
    @objc func btnLanguage() {
    }
    @objc func btnDropState() {
    }
    @IBAction func btnBack(_ sender: Any) {
    }
    @IBAction func notificationAction(_ sender: Any) {
    }
    @IBAction func addAction(_ sender: Any) {
    }
    @IBAction func locationAction(_ sender: Any) {
    }
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//          super.touchesBegan(Set<UITouch>(),with:event);
//          self.view.endEditing(true)
//          textViewComment.resignFirstResponder()
//      }
//
//      func applyNonPlaceholderStyle(_ aTextview: UITextView) {
//          aTextview.textColor = UIColor.darkText
//          aTextview.alpha = 1.0
//      }
//
//      func applyPlaceholderStyle(_ aTextview: UITextView, placeholderText: String) {
//          aTextview.textColor = UIColor.lightGray
//          aTextview.text = placeholderText
//      }
//
//      func textViewShouldBeginEditing(_ aTextView:UITextView)->Bool {
//          if aTextView==textViewComment && aTextView.text == PLACEHOLDER_TEXT {
//             moveCursorToStart(aTextView)
//             scrollViewMain.setContentOffset(CGPoint(x: scrollViewMain.contentOffset.x, y: 500), animated: true)
//          }
//          return true
//      }
//
//      func moveCursorToStart(_ aTextView:UITextView) {
//          DispatchQueue.main.async(execute: {
//              aTextView.selectedRange = NSMakeRange(0, 0);
//          })
//      }
//
//      func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
//          let newLength = textView.text.count+text.count-range.length
//          if newLength > 0 {
//              if textView == textViewComment && textView.text == PLACEHOLDER_TEXT {
//                  applyNonPlaceholderStyle(textView)
//                  textView.text=""
//              }
//              return newLength <= 1000
//          } else {
//              applyPlaceholderStyle(textView,placeholderText: PLACEHOLDER_TEXT)
//              moveCursorToStart(textView)
//              return false
//          }
//      }
//
//
//      func textViewDidBeginEditing(_ textView: UITextView) {
//          if (textView.text == PLACEHOLDER_TEXT) {
//              textViewComment.text = nil
//              textViewComment.textColor = UIColor.black
//              scrollViewMain.setContentOffset(CGPoint(x: scrollViewMain.contentOffset.x, y: 500), animated: true)
//          }
//      }
//
//      func textViewDidEndEditing(_ textView: UITextView) {
//          if textView.text.isEmpty {
//              textViewComment.text = PLACEHOLDER_TEXT
//              textViewComment.textColor = UIColor.lightGray
//          }
//          scrollViewMain.setContentOffset(CGPoint(x: scrollViewMain.contentOffset.x, y: 0), animated: true)
//          textView.resignFirstResponder()
//      }
      
      
      // MARK: - UITextFieldDelegate
      func textFieldShouldReturn(_ textField: UITextField) -> Bool {
          view.endEditing(true)
          return true
      }
      
      func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
          return true
      }
      
      func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
          return true
      }
      
      func textFieldDidBeginEditing(_ textField: UITextField) {
          
      }
}
