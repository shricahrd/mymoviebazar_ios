//
//  MoreOptionViewController.swift
//  MyMovieBazar
//
//  Created by RAKESH KUSHWAHA on 14/07/20.
//  Copyright © 2020 rakesh. All rights reserved.
//

import UIKit

class MoreOptionViewController:  UIViewController, UITableViewDelegate, UITableViewDataSource {
    var tableViewList: UITableView!
    var screenSize: CGRect = UIScreen.main.bounds
    var screenWidth:CGFloat = 0.0
    var screenHeight:CGFloat = 0.0
    var viewHeader = UIView()
    var arrayImages = [String]()
    var arrayTitle = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        view.backgroundColor = UIColor(red:255.0/255.0, green:255.0/255.0, blue:255.0/255.0, alpha:1.0)
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        arrayImages = ["notificationicon","offersicon","privacyicon","termsicon","helpicon"]
        arrayTitle = ["Notifications","Offers","Privacy Policy","Terms & Conditions","Help & Support"]

        callHeaderSetup()
    }
    
    
    func callHeaderSetup() {
        viewHeader = UIView()
        viewHeader.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height:100)
        viewHeader.backgroundColor = .red
        self.view.addSubview(viewHeader)
        
        let messageTitle: UILabel! = UILabel()
        messageTitle.frame = CGRect(x: 16, y: 35, width: viewHeader.frame.size.width/2 , height: 30)
        messageTitle.text = "Hi!"
        messageTitle.numberOfLines = 1
        messageTitle.backgroundColor = .clear
        messageTitle.textAlignment = .left
        messageTitle.textColor = .white
        messageTitle.font = UIFont.boldSystemFont(ofSize: 18)
        viewHeader.addSubview(messageTitle)
        
        let editProfileButton = UIButton()
        editProfileButton.frame = CGRect(x: 4, y: messageTitle.frame.maxY+1, width: viewHeader.frame.size.width/2-80, height: 25)
        editProfileButton.setTitle("Edit Profile >", for: .normal)
        editProfileButton.setTitleColor(.white, for: .normal)
        editProfileButton.titleLabel?.textAlignment = .left
        editProfileButton.addTarget(self, action: #selector(self.showConsultationFlow), for: .touchUpInside)
        viewHeader.addSubview(editProfileButton)
        
        let imageProduct: UIImageView! = UIImageView()
        imageProduct.frame = CGRect(x: viewHeader.frame.size.width - 100, y: 30, width: 60, height: 60)
        //imageProduct.image = UIImage(named: "imagegrid")
        imageProduct.contentMode = .scaleAspectFit
        imageProduct.backgroundColor = .white
        imageProduct.layer.cornerRadius = 30
        imageProduct.clipsToBounds = true;
        viewHeader.addSubview(imageProduct)

        self.showTableview()
    }
    
    func showTableview() {
         tableViewList=UITableView()
         tableViewList.frame=CGRect(x: 0, y: viewHeader.frame.maxY,width: screenWidth, height: screenHeight-5);
         tableViewList.dataSource=self;
         tableViewList.delegate=self;
         tableViewList.bounces=true
         tableViewList.backgroundColor = UIColor.clear
         tableViewList.separatorStyle = .none
         view.addSubview(tableViewList)
         registerNibs()
    }
    
    func registerNibs() {
         tableViewList.register(UINib(nibName: "MyAccountCell", bundle: nil), forCellReuseIdentifier: "MyAccountCell")
    }
    
    @objc func showConsultationFlow() {
        
    }
       
    // MARK: - TableView Method
     func numberOfSections(in tableView: UITableView) -> Int {
         return 1
     }
     
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int  {
        return arrayTitle.count
     }
     
     func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
         return 59
     }
     
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
     }
     
     func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
         return 0
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier:"MyAccountCell", for: indexPath as IndexPath) as? MyAccountCell {
            //cell.contentView.backgroundColor = .clear
            cell.name.text = arrayTitle[indexPath.row]
            cell.name.font = UIFont.boldSystemFont(ofSize: 14)
            cell.imageIcons.image = UIImage(named: arrayImages[indexPath.row])
            cell.radioButton.isHidden = true
            return cell
        }
          return UITableViewCell()
     }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
           let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
           if let myPlansController = storyboard.instantiateViewController(withIdentifier: "NotificationController") as? NotificationController {
              navigationController?.pushViewController(myPlansController, animated: true)
           }
         }
        if indexPath.row == 1 {
           let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
           if let myPlansController = storyboard.instantiateViewController(withIdentifier: "OffersController") as? OffersController {
              navigationController?.pushViewController(myPlansController, animated: true)
           }
        }
        
        if indexPath.row == 2 {
                  let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                  if let myPlansController = storyboard.instantiateViewController(withIdentifier: "PrivacyPolicy") as? PrivacyPolicy {
                     navigationController?.pushViewController(myPlansController, animated: true)
                  }
               }
        if indexPath.row == 3 {
                  let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                  if let myPlansController = storyboard.instantiateViewController(withIdentifier: "TermsConditions") as? TermsConditions {
                     
                     navigationController?.pushViewController(myPlansController, animated: true)
                  }
               }
        if indexPath.row == 4 {
                  let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                  if let myPlansController = storyboard.instantiateViewController(withIdentifier: "HelpSupport") as? HelpSupport {
                     navigationController?.pushViewController(myPlansController, animated: true)
                  }
               }
        
     }

}
