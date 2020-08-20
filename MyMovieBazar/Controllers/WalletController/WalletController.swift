//  WalletController.swift
//  MyMovieBazar
//  Created by RAKESH KUSHWAHA on 31/07/20.
//  Copyright © 2020 rakesh. All rights reserved.

import UIKit
class WalletController: UIViewController, UIScrollViewDelegate, UITextFieldDelegate, UITextViewDelegate {
    @IBOutlet weak var viewBg: UIView!
    var scrollViewMain: UIScrollView!
    var viewAccountBG: UIView!
    var textFieldName: UITextField!
    var viewWithdrawalBG: UIView!
    var textFieldWithdrwalAmount: UITextField!
    var viewBankNameBg: UIView!
    var textFieldBankName: UITextField!
    var viewAccountNumberBg: UIView!
    var textFieldAccountNumber: UITextField!
    var viewIFSCBg: UIView!
    var textFieldIFSC: UITextField!
    var viewBranchBg: UIView!
    var textFieldBranch: UITextField!
    var viewDescriptionBg: UIView!
    var textViewDescription: UITextView!
    var screenSize: CGRect = UIScreen.main.bounds
    var screenWidth:CGFloat = 0.0
    var screenHeight:CGFloat = 0.0

    var accountNameTextField = UITextField()
    var amountTextField = UITextField()
    var bankNameTextField = UITextField()
    var accountNumberTextField = UITextField()
    var ifscTextField = UITextField()
    var branchTextField = UITextField()
    var textViewComment = UITextView()

    let PLACEHOLDER_TEXT = "Type Here"

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
        
        let amountWithdrawTitle = UILabel()
        amountWithdrawTitle.frame = CGRect(x: 16, y: 15, width: scrollViewMain.frame.size.width - 32 , height: 50)
        amountWithdrawTitle.text = "Amount Withdraw"
        amountWithdrawTitle.numberOfLines = 1
        amountWithdrawTitle.backgroundColor = .clear
        amountWithdrawTitle.textAlignment = .left
        amountWithdrawTitle.textColor = .darkGray
        amountWithdrawTitle.font = UIFont.boldSystemFont(ofSize: 16)
        scrollViewMain.addSubview(amountWithdrawTitle)

        viewAccountBG = UIView()
        viewAccountBG.frame = CGRect(x: 16, y:amountWithdrawTitle.frame.maxY+5, width: screenWidth-32, height: 100)
        viewAccountBG.backgroundColor = UIColor(red:239.0/255.0, green:239.0/255.0, blue:239.0/255.0, alpha:1.0)
        viewAccountBG.backgroundColor = UIColor.white
        viewAccountBG.isUserInteractionEnabled = true
        viewAccountBG.layer.borderWidth = 0.4
        viewAccountBG.layer.borderColor = UIColor.lightGray.cgColor
        viewAccountBG.layer.cornerRadius = 6.0
        scrollViewMain.addSubview(viewAccountBG)
        
        let accountName: UILabel! = UILabel()
        accountName.frame = CGRect(x: 16, y: 4, width: viewAccountBG.frame.size.width - 32 , height: 30)
        accountName.text = "Account Name"
        accountName.numberOfLines = 1
        accountName.backgroundColor = .clear
        accountName.textAlignment = .left
        accountName.textColor = .darkGray
        accountName.font = UIFont(name: accountName.font.fontName, size: 15)
        viewAccountBG.addSubview(accountName)
        
        let paddingL: UIView = UIView()
        paddingL.frame = CGRect(x: 0, y: 0,width: 0, height: 10)
        accountNameTextField.frame = CGRect(x: 16, y: accountName.frame.maxY, width: viewAccountBG.frame.size.width - 32 , height: 30)
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
        withdrawalAmount.text = "Enter Withdrawal Amount"
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
        
        viewBankNameBg = UIView()
        viewBankNameBg.frame = CGRect(x: 16, y:viewWithdrawalBG.frame.maxY+20, width: screenWidth-32, height: 100)
        viewBankNameBg.backgroundColor = UIColor(red:239.0/255.0, green:239.0/255.0, blue:239.0/255.0, alpha:1.0)
        viewBankNameBg.backgroundColor = UIColor.white
        viewBankNameBg.isUserInteractionEnabled = true
        viewBankNameBg.layer.borderWidth = 0.4
        viewBankNameBg.layer.borderColor = UIColor.lightGray.cgColor
        viewBankNameBg.layer.cornerRadius = 6.0
        scrollViewMain.addSubview(viewBankNameBg)
        
        let enterBankName: UILabel! = UILabel()
        enterBankName.frame = CGRect(x: 16, y: 4, width: viewAccountBG.frame.size.width - 32 , height: 30)
        enterBankName.text = "Enter Bank Name"
        enterBankName.numberOfLines = 1
        enterBankName.backgroundColor = .clear
        enterBankName.textAlignment = .left
        enterBankName.textColor = .darkGray
        enterBankName.font = UIFont(name: enterBankName.font.fontName, size: 15)
        viewBankNameBg.addSubview(enterBankName)
        
        let paddingbankNameTextFieldL: UIView = UIView()
        paddingbankNameTextFieldL.frame = CGRect(x: 0, y: 0,width: 0, height: 10)
         bankNameTextField.frame = CGRect(x: 16, y: enterBankName.frame.maxY, width: viewAccountBG.frame.size.width - 32 , height: 30)
         bankNameTextField.delegate = self
         bankNameTextField.layer.borderColor =  UIColor(red: 215.0/255.0, green: 215.0/255.0, blue: 215.0/255.0, alpha: 1).cgColor
         bankNameTextField.textColor = UIColor.black
         bankNameTextField.leftView = paddingbankNameTextFieldL
         bankNameTextField.rightView = paddingbankNameTextFieldL
         bankNameTextField.placeholder = "Type Here"
         bankNameTextField.tintColor = UIColor.black;
         bankNameTextField.font = UIFont(name: "Arial",size: 11)
         bankNameTextField.backgroundColor = UIColor.white
         bankNameTextField.layer.cornerRadius = 0
         bankNameTextField.leftViewMode = .always
         bankNameTextField.rightViewMode = .always
         viewBankNameBg.addSubview(bankNameTextField)
        
        let viewBankNameUnline = UIView()
        viewBankNameUnline.frame = CGRect(x: 16, y:bankNameTextField.frame.maxY+1, width: viewBankNameBg.frame.size.width-32, height: 1)
        viewBankNameUnline.backgroundColor = UIColor(red:239.0/255.0, green:239.0/255.0, blue:239.0/255.0, alpha:1.0)
        viewBankNameBg.addSubview(viewBankNameUnline)
        
        viewAccountNumberBg = UIView()
        viewAccountNumberBg.frame = CGRect(x: 16, y:viewBankNameBg.frame.maxY+20, width: screenWidth-32, height: 100)
        viewAccountNumberBg.backgroundColor = UIColor(red:239.0/255.0, green:239.0/255.0, blue:239.0/255.0, alpha:1.0)
        viewAccountNumberBg.backgroundColor = UIColor.white
        viewAccountNumberBg.isUserInteractionEnabled = true
        viewAccountNumberBg.layer.borderWidth = 0.4
        viewAccountNumberBg.layer.borderColor = UIColor.lightGray.cgColor
        viewAccountNumberBg.layer.cornerRadius = 6.0
        scrollViewMain.addSubview(viewAccountNumberBg)
        
        let enterAccNumber: UILabel! = UILabel()
        enterAccNumber.frame = CGRect(x: 16, y: 4, width: viewAccountBG.frame.size.width - 32 , height: 30)
        enterAccNumber.text = "Enter A/C Number"
        enterAccNumber.numberOfLines = 1
        enterAccNumber.backgroundColor = .clear
        enterAccNumber.textAlignment = .left
        enterAccNumber.textColor = .darkGray
        enterAccNumber.font = UIFont(name: enterAccNumber.font.fontName, size: 15)
        viewAccountNumberBg.addSubview(enterAccNumber)
        
        let paddingaccountNumberTextFieldL: UIView = UIView()
        paddingaccountNumberTextFieldL.frame = CGRect(x: 0, y: 0,width: 0, height: 10)
        accountNumberTextField.frame = CGRect(x: 16, y: enterAccNumber.frame.maxY, width: viewAccountNumberBg.frame.size.width - 32 , height: 30)
        accountNumberTextField.delegate = self
        accountNumberTextField.layer.borderColor =  UIColor(red: 215.0/255.0, green: 215.0/255.0, blue: 215.0/255.0, alpha: 1).cgColor
        accountNumberTextField.textColor = UIColor.black
        accountNumberTextField.leftView = paddingaccountNumberTextFieldL
        accountNumberTextField.rightView = paddingaccountNumberTextFieldL
        accountNumberTextField.placeholder = "Type Here"
        accountNumberTextField.tintColor = UIColor.black;
        accountNumberTextField.font = UIFont(name: "Arial",size: 11)
        accountNumberTextField.backgroundColor = UIColor.white
        accountNumberTextField.layer.cornerRadius = 0
        accountNumberTextField.leftViewMode = .always
        accountNumberTextField.rightViewMode = .always
        viewAccountNumberBg.addSubview(accountNumberTextField)
        
        let viewAccNumberUnline = UIView()
        viewAccNumberUnline.frame = CGRect(x: 16, y:accountNumberTextField.frame.maxY+1, width: viewAccountNumberBg.frame.size.width-32, height: 1)
        viewAccNumberUnline.backgroundColor = UIColor(red:239.0/255.0, green:239.0/255.0, blue:239.0/255.0, alpha:1.0)
        viewAccountNumberBg.addSubview(viewAccNumberUnline)
        
        viewIFSCBg = UIView()
        viewIFSCBg.frame = CGRect(x: 16, y:viewAccountNumberBg.frame.maxY+20, width: screenWidth-32, height: 100)
        viewIFSCBg.backgroundColor = UIColor(red:239.0/255.0, green:239.0/255.0, blue:239.0/255.0, alpha:1.0)
        viewIFSCBg.backgroundColor = UIColor.white
        viewIFSCBg.isUserInteractionEnabled = true
        viewIFSCBg.layer.borderWidth = 0.4
        viewIFSCBg.layer.borderColor = UIColor.lightGray.cgColor
        viewIFSCBg.layer.cornerRadius = 6.0
        scrollViewMain.addSubview(viewIFSCBg)
        
        let enterIFSC: UILabel! = UILabel()
        enterIFSC.frame = CGRect(x: 16, y: 4, width: viewAccountBG.frame.size.width - 32 , height: 30)
        enterIFSC.text = "Enter IFSC Code"
        enterIFSC.numberOfLines = 1
        enterIFSC.backgroundColor = .clear
        enterIFSC.textAlignment = .left
        enterIFSC.textColor = .darkGray
        enterIFSC.font = UIFont(name: enterIFSC.font.fontName, size: 15)
        viewIFSCBg.addSubview(enterIFSC)
        
        
        let paddingenterIFSCL: UIView = UIView()
        paddingenterIFSCL.frame = CGRect(x: 0, y: 0,width: 0, height: 10)
           
        ifscTextField.frame = CGRect(x: 16, y: enterIFSC.frame.maxY, width: viewIFSCBg.frame.size.width - 32 , height: 30)
        ifscTextField.delegate = self
        ifscTextField.layer.borderColor =  UIColor(red: 215.0/255.0, green: 215.0/255.0, blue: 215.0/255.0, alpha: 1).cgColor
        ifscTextField.textColor = UIColor.black
        ifscTextField.leftView = paddingenterIFSCL
        ifscTextField.rightView = paddingenterIFSCL
        ifscTextField.placeholder = "Type Here"
        ifscTextField.tintColor = UIColor.black;
        ifscTextField.font = UIFont(name: "Arial",size: 11)
        ifscTextField.backgroundColor = UIColor.white
        ifscTextField.layer.cornerRadius = 0
        ifscTextField.leftViewMode = .always
        ifscTextField.rightViewMode = .always
        viewIFSCBg.addSubview(ifscTextField)
        
        let viewenterIFSCUnline = UIView()
        viewenterIFSCUnline.frame = CGRect(x: 16, y:ifscTextField.frame.maxY+1, width: viewIFSCBg.frame.size.width-32, height: 1)
        viewenterIFSCUnline.backgroundColor = UIColor(red:239.0/255.0, green:239.0/255.0, blue:239.0/255.0, alpha:1.0)
        viewIFSCBg.addSubview(viewenterIFSCUnline)
        
        viewBranchBg = UIView()
        viewBranchBg.frame = CGRect(x: 16, y:viewIFSCBg.frame.maxY+20, width: screenWidth-32, height: 100)
        viewBranchBg.backgroundColor = UIColor(red:239.0/255.0, green:239.0/255.0, blue:239.0/255.0, alpha:1.0)
        viewBranchBg.backgroundColor = UIColor.white
        viewBranchBg.isUserInteractionEnabled = true
        viewBranchBg.layer.borderWidth = 0.4
        viewBranchBg.layer.borderColor = UIColor.lightGray.cgColor
        viewBranchBg.layer.cornerRadius = 6.0
        scrollViewMain.addSubview(viewBranchBg)
        
        let enterBranch: UILabel! = UILabel()
        enterBranch.frame = CGRect(x: 16, y: 4, width: viewAccountBG.frame.size.width - 32 , height: 30)
        enterBranch.text = "Enter Branch"
        enterBranch.numberOfLines = 1
        enterBranch.backgroundColor = .clear
        enterBranch.textAlignment = .left
        enterBranch.textColor = .darkGray
        enterBranch.font = UIFont(name: enterBranch.font.fontName, size: 15)
        viewBranchBg.addSubview(enterBranch)
        
        
        let paddingBranchL: UIView = UIView()
        paddingBranchL.frame = CGRect(x: 0, y: 0,width: 0, height: 10)
           
        branchTextField.frame = CGRect(x: 16, y: enterBranch.frame.maxY, width: viewBranchBg.frame.size.width - 32 , height: 30)
        branchTextField.delegate = self
        branchTextField.layer.borderColor =  UIColor(red: 215.0/255.0, green: 215.0/255.0, blue: 215.0/255.0, alpha: 1).cgColor
        branchTextField.clipsToBounds = true
        branchTextField.textColor = UIColor.black
        branchTextField.leftView = paddingBranchL
        branchTextField.rightView = paddingBranchL
        branchTextField.placeholder = "Type Here"
        branchTextField.tintColor = UIColor.black;
        branchTextField.font = UIFont(name: "Arial",size: 11)
        branchTextField.backgroundColor = UIColor.white
        branchTextField.layer.cornerRadius = 0
        branchTextField.leftViewMode = .always
        branchTextField.rightViewMode = .always
        viewBranchBg.addSubview(branchTextField)
        
        let viewenterBranchUnline = UIView()
        viewenterBranchUnline.frame = CGRect(x: 16, y:branchTextField.frame.maxY+1, width: viewBranchBg.frame.size.width-32, height: 1)
        viewenterBranchUnline.backgroundColor = UIColor(red:239.0/255.0, green:239.0/255.0, blue:239.0/255.0, alpha:1.0)
        viewBranchBg.addSubview(viewenterBranchUnline)
        
        viewDescriptionBg = UIView()
        viewDescriptionBg.frame = CGRect(x: 16, y:viewBranchBg.frame.maxY+20, width: screenWidth-32, height: 160)
        viewDescriptionBg.backgroundColor = UIColor(red:239.0/255.0, green:239.0/255.0, blue:239.0/255.0, alpha:1.0)
        viewDescriptionBg.backgroundColor = UIColor.white
        viewDescriptionBg.isUserInteractionEnabled = true
        viewDescriptionBg.layer.borderWidth = 0.4
        viewDescriptionBg.layer.borderColor = UIColor.lightGray.cgColor
        viewDescriptionBg.layer.cornerRadius = 6.0
        scrollViewMain.addSubview(viewDescriptionBg)
        
        let descriptionTitle: UILabel! = UILabel()
        descriptionTitle.frame = CGRect(x: 16, y: 4, width: viewAccountBG.frame.size.width - 32 , height: 30)
        descriptionTitle.text = "Description"
        descriptionTitle.numberOfLines = 1
        descriptionTitle.backgroundColor = .clear
        descriptionTitle.textAlignment = .left
        descriptionTitle.textColor = .darkGray
        descriptionTitle.font = UIFont(name: descriptionTitle.font.fontName, size: 15)
        viewDescriptionBg.addSubview(descriptionTitle)

       textViewComment = UITextView()
        textViewComment.frame = CGRect(x: 16, y: descriptionTitle.frame.maxY, width: viewAccountBG.frame.size.width - 32 , height: 90)
        textViewComment.delegate = self
        textViewComment.layer.borderColor =  UIColor(red: 215.0/255.0, green: 215.0/255.0, blue: 215.0/255.0, alpha: 1).cgColor
        textViewComment.layer.borderWidth = 1
        textViewComment.layer.cornerRadius = 8.0
        textViewComment.clipsToBounds = true
        textViewComment.delegate = self
        viewDescriptionBg.addSubview(textViewComment)
        
        applyPlaceholderStyle(textViewComment, placeholderText: PLACEHOLDER_TEXT)
        
        let submitButton = UIButton()
        submitButton.frame = CGRect(x: 16, y: viewDescriptionBg.frame.maxY+26, width: scrollViewMain.frame.size.width - 32, height: 50)
        submitButton.setTitle("SUBMIT", for: .normal)
        submitButton.setTitleColor(.white, for: .normal)
        submitButton.titleLabel?.textAlignment = .center
        submitButton.backgroundColor = UIColor(red: 226.0/255.0, green: 0.0/255.0, blue: 25.0/255.0, alpha: 1)
        submitButton.layer.cornerRadius = 8.0
        submitButton.clipsToBounds = true
        submitButton.addTarget(self, action: #selector(self.showConsultationFlow), for: .touchUpInside)
        scrollViewMain.addSubview(submitButton)

        scrollViewMain.contentSize = CGSize(width: 0, height: viewDescriptionBg.frame.maxY + 400)
        scrollViewMain.keyboardDismissMode = .interactive
    }
    
    @objc func showConsultationFlow() {
           
       }
    
    @IBAction func btnBack(_ sender: Any) {
    }
    @IBAction func notificationAction(_ sender: Any) {
    }
    
    @IBAction func userAction(_ sender: Any) {
    }
    
    @IBAction func locationAction(_ sender: Any) {
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
          super.touchesBegan(Set<UITouch>(),with:event);
          self.view.endEditing(true)
          textViewComment.resignFirstResponder()
      }
      
      func applyNonPlaceholderStyle(_ aTextview: UITextView) {
          aTextview.textColor = UIColor.darkText
          aTextview.alpha = 1.0
      }
      
      func applyPlaceholderStyle(_ aTextview: UITextView, placeholderText: String) {
          aTextview.textColor = UIColor.lightGray
          aTextview.text = placeholderText
      }
      
      func textViewShouldBeginEditing(_ aTextView:UITextView)->Bool {
          if aTextView==textViewComment && aTextView.text == PLACEHOLDER_TEXT {
             moveCursorToStart(aTextView)
             scrollViewMain.setContentOffset(CGPoint(x: scrollViewMain.contentOffset.x, y: 500), animated: true)
          }
          return true
      }
      
      func moveCursorToStart(_ aTextView:UITextView) {
          DispatchQueue.main.async(execute: {
              aTextView.selectedRange = NSMakeRange(0, 0);
          })
      }
      
      func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
          let newLength = textView.text.count+text.count-range.length
          if newLength > 0 {
              if textView == textViewComment && textView.text == PLACEHOLDER_TEXT {
                  applyNonPlaceholderStyle(textView)
                  textView.text=""
              }
              return newLength <= 1000
          } else {
              applyPlaceholderStyle(textView,placeholderText: PLACEHOLDER_TEXT)
              moveCursorToStart(textView)
              return false
          }
      }
      
      
      func textViewDidBeginEditing(_ textView: UITextView) {
          if (textView.text == PLACEHOLDER_TEXT) {
              textViewComment.text = nil
              textViewComment.textColor = UIColor.black
              scrollViewMain.setContentOffset(CGPoint(x: scrollViewMain.contentOffset.x, y: 500), animated: true)
          }
      }
      
      func textViewDidEndEditing(_ textView: UITextView) {
          if textView.text.isEmpty {
              textViewComment.text = PLACEHOLDER_TEXT
              textViewComment.textColor = UIColor.lightGray
          }
          scrollViewMain.setContentOffset(CGPoint(x: scrollViewMain.contentOffset.x, y: 0), animated: true)
          textView.resignFirstResponder()
      }
      
      
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
