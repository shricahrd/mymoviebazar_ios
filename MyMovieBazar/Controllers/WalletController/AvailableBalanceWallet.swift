//
//  AvailableBalanceWallet.swift
//  MyMovieBazar
//
//  Created by Apple on 8/10/20.
//  Copyright © 2020 rakesh. All rights reserved.
//

import UIKit

class AvailableBalanceWallet: UIViewController, UIScrollViewDelegate , UITableViewDelegate,UITableViewDataSource {
   @IBOutlet weak var viewBg: UIView!
    var tableViewList: UITableView!
    var arrayTitle = [String]()
    var viewAccountBG: UIView!
    var scrollViewMain: UIScrollView!
    var screenSize: CGRect = UIScreen.main.bounds
    var screenWidth:CGFloat = 0.0
    var screenHeight:CGFloat = 0.0
    var availTitle = UILabel()
    var amount = UILabel()
    var recent = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        view.backgroundColor = UIColor(red:255.0/255.0, green:255.0/255.0, blue:255.0/255.0, alpha:1.0)

        screenWidth = screenSize.width
        screenHeight = screenSize.height
        arrayTitle = ["Movie ADS","Movie Rights","Movie Theaters","Movie Artists","Movie Technicians", "Others"]

        uiSetUp()
    }

    func uiSetUp() {
        
         scrollViewMain = UIScrollView()
         scrollViewMain.frame = CGRect(x: 0, y:80, width: screenWidth, height: screenHeight-135)
         scrollViewMain.bounces=true
         scrollViewMain.delegate=self
         scrollViewMain.backgroundColor=UIColor.clear
         scrollViewMain.isScrollEnabled = true
         scrollViewMain.clipsToBounds = true
         viewBg.addSubview(scrollViewMain)
         
         
         availTitle.frame = CGRect(x: 16, y: 15, width: scrollViewMain.frame.size.width - 32 , height: 50)
         availTitle.text = "Available Balance"
         availTitle.numberOfLines = 1
         availTitle.backgroundColor = .clear
         availTitle.textAlignment = .left
         availTitle.textColor = .darkGray
         availTitle.font = UIFont.boldSystemFont(ofSize: 16)
         scrollViewMain.addSubview(availTitle)

         
         amount.frame = CGRect(x: 16, y: availTitle.frame.maxY+1, width: scrollViewMain.frame.size.width - 32 , height: 50)
         amount.text = "\u{20B9} 60"
         amount.numberOfLines = 1
         amount.backgroundColor = .clear
         amount.textAlignment = .left
         amount.textColor = .red
         amount.font = UIFont.boldSystemFont(ofSize: 16)
         scrollViewMain.addSubview(amount)
        
         recent.frame = CGRect(x: 16, y: amount.frame.maxY+1, width: scrollViewMain.frame.size.width - 32 , height: 50)
         recent.text = "Recents"
         recent.numberOfLines = 1
         recent.backgroundColor = .clear
         recent.textAlignment = .left
         recent.textColor = .red
         recent.font = UIFont.boldSystemFont(ofSize: 16)
         scrollViewMain.addSubview(recent)
        
        
        registerNibs()
    }
    
    func registerNibs() {
        self.tableViewList=UITableView()
        self.tableViewList.frame = CGRect(x: 0, y: recent.frame.maxY+2 , width: self.scrollViewMain.frame.width, height:self.scrollViewMain.frame.height)
           self.tableViewList.backgroundColor = UIColor(red: 250.0 / 255.0, green: 250.0 / 255.0, blue:250.0 / 255.0, alpha: 1.0)
        tableViewList.dataSource=self;
        tableViewList.delegate=self;
        tableViewList.bounces=true
        tableViewList.backgroundColor = UIColor.yellow
        tableViewList.separatorStyle = .none
        tableViewList.register(UINib(nibName: "AvailableBalanceCell", bundle: nil), forCellReuseIdentifier: "AvailableBalanceCell")
        self.scrollViewMain.addSubview(tableViewList)
    }
  // MARK: - TableView Method
  func numberOfSections(in tableView: UITableView) -> Int {
      return 1
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int  {
     return 1
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return 120
  }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
          return 50
    }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
      let cell = tableView.dequeueReusableCell(withIdentifier: "AvailableBalanceCell",for: indexPath) as! AvailableBalanceCell
      
      return cell
  }
    @IBAction func notificationAction(_ sender: Any) {
    }
    @IBAction func userAction(_ sender: Any) {
      
    }
    @IBAction func locationAction(_ sender: Any) {
     
    }

}
