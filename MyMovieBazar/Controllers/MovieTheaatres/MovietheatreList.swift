//  MovietheatreList.swift
//  MyMovieBazar
//  Created by Apple on 8/14/20.
//  Copyright © 2020 rakesh. All rights reserved.

import UIKit

class MovietheatreList: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var screenSize: CGRect = UIScreen.main.bounds
    var screenWidth:CGFloat = 0.0
    var screenHeight:CGFloat = 0.0
    var viewHeader = UIView()
    var arrayImages = [String]()
    var arrayTitle = [String]()

    @IBOutlet weak var brtnBack: UIButton!
    @IBOutlet weak var lblTital: UILabel!
    @IBOutlet weak var mainViewBG: UIView!
    @IBOutlet weak var tableMainView: UITableView!
    @IBOutlet weak var btnNearByTheatres: UIButton!
    @IBOutlet weak var btnAllTheatres: UIButton!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        view.backgroundColor = UIColor(red:255.0/255.0, green:255.0/255.0, blue:255.0/255.0, alpha:1.0)
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        arrayImages = ["profileIcon","changepwdIcon","myplan","myaddress","settingIcon","logouticon"]
        arrayTitle = ["My Profile","Change Password","My Plans","My Address","Setting","Logout"]
        self.showTableview()
        }
                
    func showTableview() {
            tableMainView.dataSource=self;
            tableMainView.delegate=self;
            tableMainView.bounces=true
            tableMainView.backgroundColor = UIColor.clear
            tableMainView.separatorStyle = .none
            registerNibs()
        }
                
    func registerNibs() {
            tableMainView.register(UINib(nibName: "MovietheatresListCell", bundle: nil), forCellReuseIdentifier: "MovietheatresListCell")
        }
        
// MARK: - TableView Method
    func numberOfSections(in tableView: UITableView) -> Int {
               return 1
          }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int  {
              return 2
        }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
             return UITableView.automaticDimension
        }
    //       func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //
    //        return 40
    //       }
//           
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//               return 0
//           }
           
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
              if let cell = tableView.dequeueReusableCell(withIdentifier:"MovietheatresListCell", for: indexPath as IndexPath) as? MovietheatresListCell {
                  //cell.contentView.backgroundColor = .clear
    //              cell.name.text = arrayTitle[indexPath.row]
    //              cell.name.font = UIFont.boldSystemFont(ofSize: 14)
    //              cell.imageIcons.image = UIImage(named: arrayImages[indexPath.row])
    //              cell.radioButton.isHidden = true
                  return cell
              }
                return UITableViewCell()
        }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    @IBAction func btnBack(_ sender: Any) {
    }
    @IBAction func btnLocation(_ sender: Any) {
    }
    @IBAction func btnAdd(_ sender: Any) {
    }
    @IBAction func btnNotification(_ sender: Any) {
    }
    
    @IBAction func btnNearByTheatres(_ sender: Any) {
    }
    @IBAction func btnAllTheatres(_ sender: Any) {
    }
}
 
    

