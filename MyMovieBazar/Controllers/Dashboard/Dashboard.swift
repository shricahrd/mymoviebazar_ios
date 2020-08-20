//
//  Dashboard.swift
//  MyMovieBazar
//
//  Created by Apple on 8/12/20.
//  Copyright © 2020 rakesh. All rights reserved.
//

import UIKit

class Dashboard: UIViewController,UIScrollViewDelegate,UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

 var screenSize: CGRect = UIScreen.main.bounds
    var screenWidth:CGFloat = 0.0
    var screenHeight:CGFloat = 0.0
    var collectionViewCategory: UICollectionView!
    var layout: UICollectionViewFlowLayout!
    var collectionViewDes: UICollectionView!
    var layout1: UICollectionViewFlowLayout!
    
      var arrayCategory = [String]()
      var scrollViewMain: UIScrollView!
      @IBOutlet weak var viewHeader: UIView!
      @IBOutlet weak var UnderLine: UIView!
      override func viewDidLoad() {
            super.viewDidLoad()
            self.navigationController?.setNavigationBarHidden(true, animated: false)
            self.view.backgroundColor = UIColor.gray
            arrayCategory = ["All", "Women", "Men","Boys","Girls"]
            screenWidth = screenSize.width
            screenHeight = screenSize.height
           self.uiSetUp()
        }
        
        func uiSetUp() {
            scrollViewMain = UIScrollView()
            scrollViewMain.frame = CGRect(x: 0, y:UnderLine.frame.maxY, width: screenWidth, height: 120)
            scrollViewMain.bounces=true
            scrollViewMain.delegate=self
            scrollViewMain.backgroundColor=UIColor.yellow
            scrollViewMain.isScrollEnabled = true
            scrollViewMain.clipsToBounds = true
            self.view.addSubview(scrollViewMain)
            collectionslider()
    }
    
    
    func collectionslider() {
        layout = UICollectionViewFlowLayout()
        collectionViewCategory = UICollectionView(frame: CGRect(x: CGFloat(0), y:0, width: CGFloat(scrollViewMain.frame.width), height: scrollViewMain.frame.height), collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        collectionViewCategory.dataSource = self
        collectionViewCategory.dataSource = self
        collectionViewCategory.delegate = self
        collectionViewCategory.isScrollEnabled = true
        collectionViewCategory.isPagingEnabled = true
        collectionViewCategory.bounces = true
        collectionViewCategory.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellIdentifier")
        collectionViewCategory.backgroundColor = UIColor.clear
        collectionViewCategory.showsHorizontalScrollIndicator = false
        collectionViewCategory.showsVerticalScrollIndicator = true
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        scrollViewMain.addSubview(collectionViewCategory)
        collectionDescription()
    }
    
    func collectionDescription() {
         layout1 = UICollectionViewFlowLayout()
        collectionViewDes = UICollectionView(frame: CGRect(x: CGFloat(0), y:scrollViewMain.frame.maxY, width: CGFloat(screenWidth), height: screenHeight-240), collectionViewLayout: layout1)
         layout1.scrollDirection = .horizontal
         collectionViewDes.dataSource = self
         collectionViewDes.dataSource = self
         collectionViewDes.delegate = self
         collectionViewDes.isScrollEnabled = true
         collectionViewDes.isPagingEnabled = true
         collectionViewDes.bounces = true
         collectionViewDes.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellIdentifier")
         collectionViewDes.backgroundColor = UIColor.red
         collectionViewDes.showsHorizontalScrollIndicator = false
         collectionViewDes.showsVerticalScrollIndicator = true
         layout.minimumInteritemSpacing = 0
         layout.minimumLineSpacing = 0
        self.view.addSubview(collectionViewDes)
     }
    // MARK:- Collection View Metods
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return arrayCategory.count
    }
        
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
         return 1
     }
        
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
         return 1
     }
        
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
         
        if collectionView == collectionViewCategory {
            return UIEdgeInsets(top: -20, left: 0, bottom: 0, right: 0)
        }
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
     }
        
     // Make a cell for each cell index path
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell: UICollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: "cellIdentifier", for: indexPath)
        
        for view: UIView in (cell?.contentView.subviews)! {
              view.removeFromSuperview()
          }
        if collectionView == collectionViewCategory {
            let viewBG: UIView! = UIView()
                     viewBG.frame = CGRect(x: 0, y:0, width: screenWidth, height: 120)
                     viewBG.backgroundColor = .white
                     viewBG.layer.cornerRadius = 0
                     viewBG.clipsToBounds = true
                     viewBG.layer.borderWidth = 0
                     viewBG.layer.borderColor = UIColor.gray.cgColor
                     cell?.contentView.addSubview(viewBG)
                     
                     let imageProduct: UIImageView! = UIImageView()
                     imageProduct.frame = CGRect(x: 0, y: 0, width: viewBG.frame.size.width, height: viewBG.frame.height)
                     imageProduct.image = UIImage(named: "imagegrid")
                     imageProduct.contentMode = .scaleAspectFill
                     imageProduct.clipsToBounds = true
                     imageProduct.backgroundColor = UIColor(red: 235.0/255.0, green: 235.0/255.0, blue: 235.0/255.0, alpha: 1)
                     viewBG.addSubview(imageProduct)
                    

        }else{
            let viewBG: UIView! = UIView()
                viewBG.frame = CGRect(x: 2, y:0, width: (cell?.frame.size.width)!-8, height: (cell?.frame.size.height)!-4)
                viewBG.backgroundColor = .white
                viewBG.layer.cornerRadius = 4
                viewBG.clipsToBounds = true
                viewBG.layer.borderWidth = 1
                viewBG.layer.borderColor = UIColor.gray.cgColor
                cell?.contentView.addSubview(viewBG)
                
                let imageProduct: UIImageView! = UIImageView()
                imageProduct.frame = CGRect(x: 20, y: 20, width: viewBG.frame.size.width - 40, height: 40)
                imageProduct.image = UIImage(named: "imagegrid")
                imageProduct.contentMode = .scaleAspectFill
                imageProduct.clipsToBounds = true
                imageProduct.backgroundColor = UIColor(red: 235.0/255.0, green: 235.0/255.0, blue: 235.0/255.0, alpha: 1)
                imageProduct.layer.cornerRadius = 6
                imageProduct.clipsToBounds = true;
                viewBG.addSubview(imageProduct)
               
        }
         
        
         return cell!
     }
        
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
                    return CGSize(width: self.view.frame.width, height: 100)
        
     }

        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
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

