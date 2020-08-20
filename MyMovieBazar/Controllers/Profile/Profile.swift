//
//  Profile.swift
//  MyMovieBazar
//
//  Created by Apple on 8/12/20.
//  Copyright © 2020 rakesh. All rights reserved.
//

import UIKit

class Profile: UIViewController, UITableViewDelegate, UITableViewDataSource {
var screenSize: CGRect = UIScreen.main.bounds
var screenWidth:CGFloat = 0.0
var screenHeight:CGFloat = 0.0

var tableViewListing: UITableView!
var arrayTitle = [String]()
    
override func viewDidLoad() {
          super.viewDidLoad()
          self.navigationController?.setNavigationBarHidden(true, animated: false)
          view.backgroundColor = UIColor(red:255.0/255.0, green:255.0/255.0, blue:255.0/255.0, alpha:1.0)
          screenWidth = screenSize.width
          screenHeight = screenSize.height
          arrayTitle = ["MEMBERSHIP PLAN","SILVER PLAN","GOLD PLAN","DIAMOND PLAN"]
          registerNibs()
  }
    
        
     func registerNibs() {
            tableViewListing = UITableView()
            tableViewListing.frame = CGRect(x: 0, y: 70 , width: screenWidth, height:screenHeight-220)
            tableViewListing.dataSource=self;
            tableViewListing.delegate=self;
            tableViewListing.bounces=false
            tableViewListing.backgroundColor = UIColor.white
            tableViewListing.separatorStyle = .none
            tableViewListing.register(UINib(nibName: "ProfileCell", bundle: nil), forCellReuseIdentifier: "ProfileCell")
           self.view.addSubview(tableViewListing)
        
        let contactPerson = UIButton()
        contactPerson.frame = CGRect(x: 16, y: tableViewListing.frame.maxY+5, width: screenWidth-32, height: 50)
        contactPerson.setTitle("CONTACT PERSON", for: .normal)
        contactPerson.setTitleColor(.white, for: .normal)
        contactPerson.titleLabel?.textAlignment = .center
        contactPerson.backgroundColor = UIColor(red: 226.0/255.0, green: 0.0/255.0, blue: 25.0/255.0, alpha: 1)
        contactPerson.layer.cornerRadius = 8.0
        contactPerson.clipsToBounds = true
        contactPerson.addTarget(self, action: #selector(self.contactPerson), for: .touchUpInside)
        self.view.addSubview(contactPerson)

      }
        
     // MARK: - TableView Method
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int  {

            return 10
        }

      func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
          if indexPath.row == 0 {
              return 180
           }
           return UITableView.automaticDimension
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell",for: indexPath) as! ProfileCell
            
            
            if indexPath.row == 0{
                cell.backgroundColor = UIColor.clear
                cell.lblName.isHidden = true
                cell.lblName1.isHidden = true
                
                let viewBG = UIView()
                viewBG.frame = CGRect(x: 0, y: 0, width: cell.frame.width, height: cell.frame.height  );
                viewBG.backgroundColor = UIColor.clear
                 cell.addSubview(viewBG)

                let imageProduct: UIImageView! = UIImageView()
                imageProduct.frame = CGRect(x: 16, y: 20, width: 60, height:60)
                imageProduct.image = UIImage(named: "IMG_RS.png")
                imageProduct.contentMode = .scaleAspectFill
                imageProduct.clipsToBounds = true
                imageProduct.backgroundColor = UIColor(red: 235.0/255.0, green: 235.0/255.0, blue: 235.0/255.0, alpha: 1)
                viewBG.addSubview(imageProduct)

                 let lblName = UILabel()
                 lblName.frame = CGRect(x: 16, y: imageProduct.frame.maxY+15, width: viewBG.frame.width-32, height: 20);
                 lblName.text = "Naame";
                 lblName.textAlignment = .left
                 lblName.font = UIFont.boldSystemFont(ofSize: 14)
                 lblName.textColor = UIColor.black
                 viewBG.addSubview(lblName)

                 let lblName1 = UILabel()
                 lblName1.frame = CGRect(x: 16, y: lblName.frame.maxY, width: viewBG.frame.width-32, height: 20);
                 lblName1.text = "Ram";
                 lblName1.textAlignment = .left
                 lblName1.font = UIFont.boldSystemFont(ofSize: 14)
                 lblName1.textColor = UIColor.gray
                 viewBG.addSubview(lblName1)

            }else{
                cell.backgroundColor = UIColor.green
                cell.lblName.text = "Generes";
                cell.lblName1.text = "yes";

            }
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

