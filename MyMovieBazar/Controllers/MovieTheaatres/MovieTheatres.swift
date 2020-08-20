//
//  MovieTheatres.swift
//  MyMovieBazar
//
//  Created by Apple on 8/12/20.
//  Copyright © 2020 rakesh. All rights reserved.
//

import UIKit

class MovieTheatres: UIViewController, UITableViewDelegate, UITableViewDataSource {
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
          view.backgroundColor = UIColor(red:255.0/255.0, green:255.0/255.0, blue:255.0/255.0, alpha:1.0)
          screenWidth = screenSize.width
          screenHeight = screenSize.height
          arrayTitle = ["MEMBERSHIP PLAN","SILVER PLAN","GOLD PLAN","DIAMOND PLAN"]
          registerNibs()
  }
    
     func registerNibs() {
        let imageProduct: UIImageView! = UIImageView()
        imageProduct.frame = CGRect(x: 0, y: UnderLine.frame.maxY, width: screenWidth, height: 100)
        imageProduct.image = UIImage(named: "traile.jpeg")
        imageProduct.backgroundColor = UIColor(red: 235.0/255.0, green: 235.0/255.0, blue: 235.0/255.0, alpha: 1)
        imageProduct.contentMode = .scaleAspectFill
        imageProduct.clipsToBounds = true
        self.view.addSubview(imageProduct)
        
        
        tableViewListing = UITableView()
        tableViewListing.frame = CGRect(x: 0, y: imageProduct.frame.maxY , width: screenWidth, height:screenHeight-220)
        tableViewListing.dataSource=self;
        tableViewListing.delegate=self;
        tableViewListing.bounces=true
        tableViewListing.backgroundColor = UIColor.yellow
        tableViewListing.separatorStyle = .none
        tableViewListing.register(UINib(nibName: "MovietheatresCell", bundle: nil), forCellReuseIdentifier: "MovietheatresCell")
        self.view.addSubview(tableViewListing)

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
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovietheatresCell",for: indexPath) as! MovietheatresCell
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

