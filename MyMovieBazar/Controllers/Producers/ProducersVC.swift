//  ProducersVC.swift
//  MyMovieBazar
//  Created by Apple on 8/12/20.
//  Copyright © 2020 rakesh. All rights reserved.

import UIKit

class ProducersVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
 
 var screenSize: CGRect = UIScreen.main.bounds
 var screenWidth: CGFloat = 0.0
 var screenHeight: CGFloat = 0.0
 var collectionViewCategory: UICollectionView!
 var layout: UICollectionViewFlowLayout!
 var arrayCategory = [String]()
    
 override func viewDidLoad() {
     super.viewDidLoad()
     screenWidth = screenSize.width
     screenHeight = screenSize.height
     arrayCategory = ["All", "Women", "Men","Boys","Girls","All", "Women", "Men","Boys","Girls"]
     self.view.backgroundColor = UIColor(red:215.0 / 255.0, green:215.0 / 255.0, blue:215.0 / 255.0, alpha: 1.0)
    callcollectionCategory()
 }
 
 func callcollectionCategory() {
     layout = UICollectionViewFlowLayout()
     collectionViewCategory = UICollectionView(frame: CGRect(x: CGFloat(0), y:70, width: CGFloat(screenWidth), height: screenHeight-170), collectionViewLayout: layout)
     layout.scrollDirection = .vertical
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
     self.view.addSubview(collectionViewCategory)
 }
 
 // MARK:- Collection View Metods
 func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayCategory.count
}
    
 func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
     return 7
 }
    
 func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
     return 1
 }
    
 func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
     return UIEdgeInsets(top: 4, left: 4, bottom: 0, right: 0)
 }
    
 // Make a cell for each cell index path
 func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     let cell: UICollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: "cellIdentifier", for: indexPath)
    
                 for view: UIView in (cell?.contentView.subviews)! {
          view.removeFromSuperview()
      }
      let viewBG: UIView! = UIView()
      viewBG.frame = CGRect(x: 2, y:0, width: (cell?.frame.size.width)!-8, height: (cell?.frame.size.height)!-4)
      viewBG.backgroundColor = .white
      viewBG.layer.cornerRadius = 4
      viewBG.clipsToBounds = true
      viewBG.layer.borderWidth = 1
      viewBG.layer.borderColor = UIColor.gray.cgColor
      cell?.contentView.addSubview(viewBG)
      
      let imageProduct: UIImageView! = UIImageView()
      imageProduct.frame = CGRect(x: 0, y: 0, width: viewBG.frame.size.width, height: 65)
      imageProduct.image = UIImage(named: "imagegrid")
      imageProduct.contentMode = .scaleAspectFill
      imageProduct.clipsToBounds = true
      imageProduct.backgroundColor = UIColor(red: 235.0/255.0, green: 235.0/255.0, blue: 235.0/255.0, alpha: 1)
      imageProduct.layer.cornerRadius = 6
      imageProduct.clipsToBounds = true;
      viewBG.addSubview(imageProduct)
     
     let lbltitle = UILabel()
     lbltitle.frame = CGRect(x: 0, y: imageProduct.frame.maxY+2, width: viewBG.frame.size.width, height: 20)
//     title.text = self.arrayCategory[indexPath.row]
     lbltitle.text = "dfgd"
     lbltitle.numberOfLines = 1
     lbltitle.backgroundColor = .clear
     lbltitle.textAlignment = .center
     lbltitle.textColor = .black
     lbltitle.font = UIFont.boldSystemFont(ofSize: 11)
     viewBG.addSubview(lbltitle)
    
     return cell!
 }
    
 func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      return CGSize(width: self.view.frame.width/4.2, height: 100)
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
