//
//  CityLocation.swift
//  MyMovieBazar
//
//  Created by Apple on 8/12/20.
//  Copyright © 2020 rakesh. All rights reserved.
//

import UIKit

class CityLocation: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var screenSize: CGRect = UIScreen.main.bounds
    var screenWidth:CGFloat = 0.0
    var screenHeight:CGFloat = 0.0
    @IBOutlet weak var lblHeaderTitale: UILabel!
    var tableViewListing: UITableView!
    var arrayTitle = [String]()
    @IBOutlet weak var viewHeader: UIView!
    @IBOutlet weak var UnderLine: UIView!
    override func viewDidLoad() {
          super.viewDidLoad()
          self.navigationController?.setNavigationBarHidden(true, animated: false)
          self.view.backgroundColor = UIColor.gray
          screenWidth = screenSize.width
          screenHeight = screenSize.height
          arrayTitle = ["MEMBERSHIP PLAN","SILVER PLAN","GOLD PLAN","DIAMOND PLAN"]
          registerNibs()
  }
    
     func registerNibs() {
        
        let searchTextField =  UITextField(frame: CGRect(x: 20, y: UnderLine.frame.maxY+5, width: screenWidth-40, height: 40))
           searchTextField.placeholder = "Search for your City"
           searchTextField.font = UIFont.systemFont(ofSize: 15)
           searchTextField.borderStyle = UITextField.BorderStyle.roundedRect
           searchTextField.autocorrectionType = UITextAutocorrectionType.no
           searchTextField.keyboardType = UIKeyboardType.default
           searchTextField.returnKeyType = UIReturnKeyType.done
           searchTextField.clearButtonMode = UITextField.ViewMode.whileEditing
           searchTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
           searchTextField.delegate = self
           self.view.addSubview(searchTextField)
        
        let detectMyLocation = UIButton()
        detectMyLocation.frame = CGRect(x: 16, y: searchTextField.frame.maxY+10, width: screenWidth-32, height: 40)
        detectMyLocation.setTitle("Detect my Location", for: .normal)
        detectMyLocation.setTitleColor(.red, for: .normal)
        detectMyLocation.titleLabel?.textAlignment = .center
        detectMyLocation.backgroundColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1)
        detectMyLocation.layer.cornerRadius = 8.0
        detectMyLocation.clipsToBounds = true
        detectMyLocation.addTarget(self, action: #selector(self.detectMyLocation), for: .touchUpInside)
        self.view.addSubview(detectMyLocation)
        
        tableViewListing = UITableView()
        tableViewListing.frame = CGRect(x: 0, y: detectMyLocation.frame.maxY+10 , width: screenWidth, height:screenHeight-260)
        tableViewListing.dataSource=self;
        tableViewListing.delegate=self;
        tableViewListing.bounces=true
        tableViewListing.backgroundColor = UIColor.yellow
        tableViewListing.separatorStyle = .none
        tableViewListing.register(UINib(nibName: "stateLocationCell", bundle: nil), forCellReuseIdentifier: "stateLocationCell")
        self.view.addSubview(tableViewListing)
        
        let submit = UIButton()
        submit.frame = CGRect(x: 16, y: tableViewListing.frame.maxY+2, width: screenWidth-32, height: 40)
        submit.setTitle("SUBMIT", for: .normal)
        submit.setTitleColor(.white, for: .normal)
        submit.titleLabel?.textAlignment = .center
        submit.backgroundColor = UIColor.red
        submit.layer.cornerRadius = 0
        submit.clipsToBounds = true
        submit.addTarget(self, action: #selector(self.submit), for: .touchUpInside)
        self.view.addSubview(submit)

     }
    @objc func submit() {
               
        }
    @objc func detectMyLocation() {
           
       }
// MARK: - TableView Method
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int  {
       return 20
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
      
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "stateLocationCell",for: indexPath) as! stateLocationCell
        cell.lbltitale.text = "dhefgwekjfhjke"
        return cell
    }
    @objc func contactPerson() {
    }
    @IBAction func btnBack(_ sender: Any) {
    }
    @IBAction func btnLocation(_ sender: Any) {
    }
    @IBAction func btnAdd(_ sender: Any) {
    }
    @IBAction func btnNotification(_ sender: Any) {
    }

}

// MARK:- ---> UITextFieldDelegate

extension CityLocation: UITextFieldDelegate {

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        // return NO to disallow editing.
        print("TextField should begin editing method called")
        return true
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        // became first responder
        print("TextField did begin editing method called")
    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
        print("TextField should snd editing method called")
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
        print("TextField did end editing method called")
    }

    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        // if implemented, called in place of textFieldDidEndEditing:
        print("TextField did end editing with reason method called")
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // return NO to not change text
        print("While entering the characters this method gets called")
        return true
    }

    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        // called when clear button pressed. return NO to ignore (no notifications)
        print("TextField should clear method called")
        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // called when 'return' key pressed. return NO to ignore.
        print("TextField should return method called")
        // may be useful: textField.resignFirstResponder()
        return true
    }

}

// MARK: UITextFieldDelegate <---
