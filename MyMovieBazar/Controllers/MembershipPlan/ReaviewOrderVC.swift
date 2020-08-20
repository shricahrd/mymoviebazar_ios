//
//  ReaviewOrderVC.swift
//  MyMovieBazar
//
//  Created by Apple on 8/12/20.
//  Copyright © 2020 rakesh. All rights reserved.
//

import UIKit

class ReaviewOrderVC: UIViewController, UIScrollViewDelegate  {

 var screenSize: CGRect = UIScreen.main.bounds
 var screenWidth: CGFloat = 0.0
 var screenHeight: CGFloat = 0.0
 var scrollViewMain = UIScrollView()
 var viewBg = UIView()
 
 
 override func viewDidLoad() {
     super.viewDidLoad()
     screenWidth = screenSize.width
     screenHeight = screenSize.height
     
     self.view.backgroundColor = UIColor(red:215.0 / 255.0, green:215.0 / 255.0, blue:215.0 / 255.0, alpha: 1.0)
     self.uiSetUpScrollView()
 }
    
    func uiSetUpScrollView() {
          scrollViewMain.frame = CGRect(x: 0, y: 70, width: screenWidth, height: screenHeight);
          scrollViewMain.bounces = true
          scrollViewMain.delegate = self
          scrollViewMain.backgroundColor = UIColor(red:215.0 / 255.0, green:215.0 / 255.0, blue:215.0 / 255.0, alpha: 1.0)
          view.addSubview(scrollViewMain)
    uiViewsetup()
    }
    
    func uiViewsetup() {
         
        viewBg.frame = CGRect(x: 0, y: 0, width: screenWidth, height: 340  );
        viewBg.backgroundColor = UIColor.white
        scrollViewMain.addSubview(viewBg)
        
        let title = UILabel()
        title.frame = CGRect(x: 16, y: 5, width: screenWidth-10, height: 40);
        title.text = "Reaview Order";
        title.font = UIFont.boldSystemFont(ofSize: 20)
        viewBg.addSubview(title)
        
        let viewBg1 = UIView()
        viewBg1.frame = CGRect(x: 16, y: title.frame.maxY+5, width: screenWidth-32, height: 200  );
        viewBg1.backgroundColor = UIColor(red:3.0 / 255.0, green:135.0 / 255.0, blue:205.0 / 255.0, alpha: 1.0)
        viewBg1.layer.cornerRadius = 5
        viewBg1.clipsToBounds = true
        viewBg.addSubview(viewBg1)
        
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
        
        let PayNow = UIButton()
        PayNow.frame = CGRect(x: 16, y: viewBg1.frame.maxY+10, width: screenWidth-32, height: 45)
        PayNow.backgroundColor = UIColor(red:226.0 / 255.0, green:0.0 / 255.0, blue:25.0 / 255.0, alpha: 1.0)
        PayNow.setTitle("PAY NOW", for: .normal)
        PayNow.layer.borderColor = UIColor.red.cgColor
        PayNow.layer.borderWidth = 0
        PayNow.layer.cornerRadius = 5
        PayNow.clipsToBounds = true
        PayNow.setTitleColor(.white, for: .normal)
        PayNow.addTarget(self,action:#selector(self.clickPayNow(_:)),for: UIControl.Event.touchUpInside)
        PayNow.isUserInteractionEnabled = true
        viewBg.addSubview(PayNow)
        
         uiViewsetup3()
    }
    func uiViewsetup3() {
        let viewBg3 = UIView()
        viewBg3.frame = CGRect(x: 0, y: viewBg.frame.maxY+5, width: screenWidth, height: 180  );
        viewBg3.backgroundColor = UIColor.white
        scrollViewMain.addSubview(viewBg3)
        
        let lblContactInformation = UILabel()
        lblContactInformation.frame = CGRect(x: 16, y: 0, width: viewBg3.frame.width-32, height: 40);
        lblContactInformation.text = "Contact Information";
        lblContactInformation.textAlignment = .left
        lblContactInformation.textColor = UIColor.black
        lblContactInformation.font = UIFont.boldSystemFont(ofSize: 18)
        viewBg3.addSubview(lblContactInformation)
        
        
        let lblName = UILabel()
        lblName.frame = CGRect(x: 16, y: lblContactInformation.frame.maxY+5, width: viewBg3.frame.width-32, height: 50);
        lblName.text = "Rahul Akshya Nagar 1st Block 1st Cross Rammurthy nagar Banglore-560016";
        lblName.textAlignment = .left
        lblName.numberOfLines = 10
        lblName.textColor = UIColor.black
        lblName.font = UIFont.boldSystemFont(ofSize: 14)
        viewBg3.addSubview(lblName)
        
        let changeAddress = UIButton()
        changeAddress.frame = CGRect(x: 16, y: lblName.frame.maxY+10, width: screenWidth-32, height: 45)
        changeAddress.setTitle("Change Address", for: .normal)
        changeAddress.setTitleColor(UIColor(red:226.0 / 255.0, green:0.0 / 255.0, blue:25.0 / 255.0, alpha: 1.0), for: .normal)
        changeAddress .titleLabel?.textAlignment = .left
        changeAddress.addTarget(self,action:#selector(self.changeAddress(_:)),for: UIControl.Event.touchUpInside)
        changeAddress.isUserInteractionEnabled = true
        viewBg3.addSubview(changeAddress)
        
     }
    @IBAction func clickPayNow(_ sender: Any) {
        
    }
    @IBAction func changeAddress(_ sender: Any) {
        
    }
}
