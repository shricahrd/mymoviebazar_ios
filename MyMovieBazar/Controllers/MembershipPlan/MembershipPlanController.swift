//
//  MembershipPlanController.swift
//  MyMovieBazar
//
//  Created by Apple on 8/11/20.
//  Copyright © 2020 rakesh. All rights reserved.
//

import UIKit

class MembershipPlanController: UIViewController, UITableViewDelegate, UITableViewDataSource {
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
        tableViewListing.frame = CGRect(x: 0, y: 70 , width: screenWidth, height:screenHeight-160)
        tableViewListing.dataSource=self;
        tableViewListing.delegate=self;
        tableViewListing.bounces=true
        tableViewListing.backgroundColor = UIColor.white
        tableViewListing.separatorStyle = .none
        tableViewListing.register(UINib(nibName: "MembershipCell", bundle: nil), forCellReuseIdentifier: "MembershipCell")
       self.view.addSubview(tableViewListing)
    
  }
    
 // MARK: - TableView Method
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int  {
       return 4
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
                    return UITableView.automaticDimension

    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 210
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       if let cell = tableView.dequeueReusableCell(withIdentifier:"MembershipCell", for: indexPath as IndexPath) as? MembershipCell {
        if indexPath.row == 0{
            let viewBG = UIView()
             viewBG.frame = CGRect(x: 0, y: 0, width: screenWidth, height: 200  );
             viewBG.backgroundColor = UIColor(red:255.0 / 255.0, green:255.0 / 255.0, blue:255.0 / 255.0, alpha: 1.0)
             viewBG.layer.cornerRadius = 5
             viewBG.clipsToBounds = true
             cell.addSubview(viewBG)
            
            
            let imageProduct: UIImageView! = UIImageView()
            imageProduct.frame = CGRect(x: viewBG.frame.size.width/2-25, y: 40, width: 60, height:60)
            imageProduct.image = UIImage(named: "IMG_RS.png")
            imageProduct.contentMode = .scaleAspectFill
            imageProduct.backgroundColor = UIColor(red: 235.0/255.0, green: 235.0/255.0, blue: 235.0/255.0, alpha: 1)
            imageProduct.layer.cornerRadius = 6
            imageProduct.clipsToBounds = true;
            viewBG.addSubview(imageProduct)
             
             let lblSelect = UILabel()
             lblSelect.frame = CGRect(x: 0, y: imageProduct.frame.maxY, width: viewBG.frame.width, height: 40);
             lblSelect.text = "SELECT YOUR";
             lblSelect.textAlignment = .center
             lblSelect.font = UIFont.boldSystemFont(ofSize: 18)
             lblSelect.textColor = UIColor.gray
             viewBG.addSubview(lblSelect)
            
             let lblMember = UILabel()
             lblMember.frame = CGRect(x: 0, y: lblSelect.frame.maxY, width: viewBG.frame.width, height: 40);
             lblMember.text = "MEMBERSHIP PLAN";
             lblMember.textAlignment = .center
             lblMember.font = UIFont.boldSystemFont(ofSize: 18)
             lblMember.textColor = UIColor.black
             viewBG.addSubview(lblMember)

        }else{
            let viewBg1 = UIView()
             viewBg1.frame = CGRect(x: 16, y: 3, width: screenWidth-32, height: 200  );
             viewBg1.backgroundColor = UIColor(red:3.0 / 255.0, green:135.0 / 255.0, blue:205.0 / 255.0, alpha: 1.0)
             viewBg1.layer.cornerRadius = 5
             viewBg1.clipsToBounds = true
             cell.addSubview(viewBg1)
             
             let title1 = UILabel()
             title1.frame = CGRect(x: 16, y: 0, width: viewBg1.frame.width-32, height: 40);
             title1.text = "SILVER PLAN";
             title1.font = UIFont.boldSystemFont(ofSize: 18)
             title1.textColor = UIColor.white
             viewBg1.addSubview(title1)
             
             let title2 = UILabel()
             title2.frame = CGRect(x: 16, y: title1.frame.maxY, width: viewBg1.frame.width-32, height: 25);
             title2.text = "Take 2 Movies distribution";
             title2.font = UIFont.boldSystemFont(ofSize: 14)
             title2.textColor = UIColor.white
             viewBg1.addSubview(title2)
             
             let title3 = UILabel()
             title3.frame = CGRect(x: 16, y: title2.frame.maxY, width: viewBg1.frame.width-32, height: 25);
             title3.text = "Full suport from Producer";
             title3.font = UIFont.boldSystemFont(ofSize: 14)
             title3.textColor = UIColor.white
             viewBg1.addSubview(title3)
             
             let viewBg2 = UIView()
             viewBg2.frame = CGRect(x: 16, y: title3.frame.maxY+20, width: 150, height: 60  );
             viewBg2.backgroundColor = UIColor(red:3.0 / 255.0, green:61.0 / 255.0, blue:103.0 / 255.0, alpha: 1.0)
             viewBg2.layer.cornerRadius = 5
             viewBg2.clipsToBounds = true
             viewBg1.addSubview(viewBg2)
             
             let title4 = UILabel()
             title4.frame = CGRect(x: 2, y: 5, width: viewBg2.frame.width-4, height: 25);
             title4.text = "Rs.4999";
             title4.font = UIFont.boldSystemFont(ofSize: 18)
             title4.textColor = UIColor.white
             title4.textAlignment = .center
             viewBg2.addSubview(title4)
             
             let title5 = UILabel()
             title5.frame = CGRect(x: 2, y: title4.frame.maxY, width: viewBg2.frame.width-4, height: 25);
             title5.text = "For 3 months";
             title5.textAlignment = .center
             title5.textColor = UIColor.white
             title5.font = UIFont.boldSystemFont(ofSize: 10)
             viewBg2.addSubview(title5)
            
            if indexPath.row == 2{
                viewBg1.backgroundColor = UIColor(red:255.0 / 255.0, green:139.0 / 255.0, blue:34.0 / 255.0, alpha: 1.0)
                viewBg2.backgroundColor = UIColor(red:151.0 / 255.0, green:86.0 / 255.0, blue:22.0 / 255.0, alpha: 1.0)

            }
            if indexPath.row == 3{
                viewBg1.backgroundColor = UIColor(red:255.0 / 255.0, green:4.0 / 255.0, blue:18.0 / 255.0, alpha: 1.0)
                viewBg2.backgroundColor = UIColor(red:143.0 / 255.0, green:16.0 / 255.0, blue:15.0 / 255.0, alpha: 1.0)

        }
            
        }
           return cell
       }
         return UITableViewCell()

    }
    
}
