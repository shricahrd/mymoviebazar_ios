//  NotificationController.swift
//  MyMovieBazar
//  Created by RAKESH KUSHWAHA on 21/07/20.
//  Copyright © 2020 rakesh. All rights reserved.

import UIKit

class NotificationController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var screenSize: CGRect = UIScreen.main.bounds
    var screenWidth:CGFloat = 0.0
    var screenHeight:CGFloat = 0.0
    @IBOutlet var tableViewListing: UITableView!
    var arrayTitle = [String]()

    override func viewDidLoad() {
          super.viewDidLoad()
          self.navigationController?.setNavigationBarHidden(true, animated: false)
          view.backgroundColor = UIColor(red:239.0/255.0, green:239.0/255.0, blue:239.0/255.0, alpha:1.0)
         
          screenWidth = screenSize.width
          screenHeight = screenSize.height
          arrayTitle = ["Movie ADS","Movie Rights","Movie Theaters","Movie Artists","Movie Technicians", "Others"]
          registerNibs()
    }
      
    
    func registerNibs() {
        tableViewListing.dataSource=self;
        tableViewListing.delegate=self;
        tableViewListing.bounces=true
        tableViewListing.backgroundColor = UIColor.clear
        tableViewListing.separatorStyle = .none
        tableViewListing.register(UINib(nibName: "NotificationCell", bundle: nil), forCellReuseIdentifier: "NotificationCell")
    }
    
    // MARK: - TableView Method
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int  {
       return arrayTitle.count
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       if let cell = tableView.dequeueReusableCell(withIdentifier:"NotificationCell", for: indexPath as IndexPath) as? NotificationCell {
           //cell.contentView.backgroundColor = .clear
           cell.title.text = "Update your details"
           cell.title.font = UIFont.boldSystemFont(ofSize: 14)
           cell.contentView.backgroundColor = UIColor(red:239.0/255.0, green:239.0/255.0, blue:239.0/255.0, alpha:1.0)
           cell.viewBg.backgroundColor = UIColor.white
                      cell.viewBg.isUserInteractionEnabled = true
                      cell.viewBg.layer.borderWidth = 0.4
                      cell.viewBg.layer.borderColor = UIColor.lightGray.cgColor
                      cell.viewBg.layer.cornerRadius = 6.0
           return cell
       }
         return UITableViewCell()

    }
    
}
