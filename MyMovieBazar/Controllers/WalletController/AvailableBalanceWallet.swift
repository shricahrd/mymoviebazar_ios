//
//  AvailableBalanceWallet.swift
//  MyMovieBazar
//
//  Created by Apple on 8/10/20.
//  Copyright © 2020 rakesh. All rights reserved.
//

import UIKit

class AvailableBalanceWallet: UIViewController, UIScrollViewDelegate {
   @IBOutlet weak var viewBg: UIView!
   
    var viewAccountBG: UIView!
    var scrollViewMain: UIScrollView!
    var screenSize: CGRect = UIScreen.main.bounds
    var screenWidth:CGFloat = 0.0
    var screenHeight:CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        view.backgroundColor = UIColor(red:255.0/255.0, green:255.0/255.0, blue:255.0/255.0, alpha:1.0)

        screenWidth = screenSize.width
        screenHeight = screenSize.height
        uiSetUp()
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
         
         let availTitle = UILabel()
         availTitle.frame = CGRect(x: 16, y: 15, width: scrollViewMain.frame.size.width - 32 , height: 50)
         availTitle.text = "Available Balance"
         availTitle.numberOfLines = 1
         availTitle.backgroundColor = .clear
         availTitle.textAlignment = .left
         availTitle.textColor = .darkGray
         availTitle.font = UIFont.boldSystemFont(ofSize: 16)
         scrollViewMain.addSubview(availTitle)

         let amount = UILabel()
        amount.frame = CGRect(x: 16, y: availTitle.frame.maxY+1, width: scrollViewMain.frame.size.width - 32 , height: 50)
         amount.text = "\u{20B9} 60"
         amount.numberOfLines = 1
         amount.backgroundColor = .clear
         amount.textAlignment = .left
         amount.textColor = .red
         amount.font = UIFont.boldSystemFont(ofSize: 16)
         scrollViewMain.addSubview(amount)
        
        
        
    }
    
    @IBAction func notificationAction(_ sender: Any) {
      
    }
      
    @IBAction func userAction(_ sender: Any) {
      
    }
      
    @IBAction func locationAction(_ sender: Any) {
     
    }

}
