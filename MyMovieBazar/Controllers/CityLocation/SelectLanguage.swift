//
//  SelectLanguage.swift
//  MyMovieBazar
//
//  Created by Apple on 8/13/20.
//  Copyright © 2020 rakesh. All rights reserved.
//

import UIKit

class SelectLanguage: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var screenSize: CGRect = UIScreen.main.bounds
    var screenWidth:CGFloat = 0.0
    var screenHeight:CGFloat = 0.0
    var tableViewListing: UITableView!
    var arrayTitle = [String]()
    override func viewDidLoad() {
          super.viewDidLoad()
          self.navigationController?.setNavigationBarHidden(true, animated: false)
          self.view.backgroundColor = UIColor.white
          screenWidth = screenSize.width
          screenHeight = screenSize.height
          arrayTitle = ["MEMBERSHIP PLAN","SILVER PLAN","GOLD PLAN","DIAMOND PLAN"]
          registerNibs()
  }
    
     func registerNibs() {
        let imageProduct: UIImageView! = UIImageView()
        imageProduct.frame = CGRect(x:0, y: 0, width: screenWidth, height:150)
        imageProduct.image = UIImage(named: "traile.jpeg")
        imageProduct.backgroundColor = UIColor(red: 235.0/255.0, green: 235.0/255.0, blue: 235.0/255.0, alpha: 1)
        imageProduct.contentMode = .scaleAspectFill
        imageProduct.clipsToBounds = true;
        self.view.addSubview(imageProduct)
        
        tableViewListing = UITableView()
        tableViewListing.frame = CGRect(x: 0, y: imageProduct.frame.maxY , width: screenWidth, height:screenHeight-280)
        tableViewListing.dataSource=self;
        tableViewListing.delegate=self;
        tableViewListing.bounces=true
        tableViewListing.backgroundColor = UIColor.white
        tableViewListing.separatorStyle = .none
        tableViewListing.register(UINib(nibName: "stateLocationCell", bundle: nil), forCellReuseIdentifier: "stateLocationCell")
        self.view.addSubview(tableViewListing)
        
        let chooseLanguage = UIButton()
        chooseLanguage.frame = CGRect(x: 0, y: tableViewListing.frame.maxY+10, width: screenWidth, height: 40)
        chooseLanguage.setTitle("CHOOSELANGUAGE", for: .normal)
        chooseLanguage.setTitleColor(.white, for: .normal)
        chooseLanguage.titleLabel?.textAlignment = .center
        chooseLanguage.backgroundColor = UIColor.red
        chooseLanguage.layer.cornerRadius = 0
        chooseLanguage.clipsToBounds = true
        chooseLanguage.addTarget(self, action: #selector(self.chooseLanguage), for: .touchUpInside)
        self.view.addSubview(chooseLanguage)

     }
    @objc func chooseLanguage() {
               
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
        cell.lbltitale.text = "English"
        cell.lbltitale.backgroundColor = .clear
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

