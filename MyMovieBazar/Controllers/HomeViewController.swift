//
//  HomeViewController.swift
//  MyMovieBazar
//
//  Created by RAKESH KUSHWAHA on 11/07/20.
//  Copyright © 2020 rakesh. All rights reserved.
//

import UIKit
private let reuseIdentifier = "cellId"
class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    var btnBack = UIButton()
    var btnLocation = UIButton()
    var btnAdd = UIButton()
    var btnNotification = UIButton()
    let cellId = "cellId"
    let cellMenuBarCellId = "MenuBarCell"
    let layoutMenu = UICollectionViewFlowLayout()
    var collectionViewMenu = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    var screenSize:CGRect = UIScreen.main.bounds
    var screenWidth:CGFloat = 0.0
    var screenHeight:CGFloat = 0.0
    var layout = UICollectionViewFlowLayout()
    var collectionViewMain = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    var arrayMain = ["RELEASING THIS WEEK","RUNNING SUCCESSFULLY","COMMING SOON"]
    let records = NSMutableArray()
    var selectedIndex = 0
    let tagForPlaceHolder = 100
    var lastContentOffset: CGFloat = 0
    var array_selecteditems = NSMutableArray()
    var viewMessageBG = UIView()
    var selectedAction = 0
    enum ScrollDirection {
        case up, down, none
    }
    private var scrollDirection: ScrollDirection = .up
    let chatButton = UIButton()
    let notiButton = UIButton()
    let networkErrorButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 241.0/255.0, green: 241.0/255.0, blue: 241.0/255.0, alpha: 1.0)
        self.screenWidth = screenSize.width
        self.screenHeight = screenSize.height
        
        uiShowUpBadges()
//        let backItem = UIBarButtonItem()
//        backItem.title = ""
//        navigationItem.backBarButtonItem = backItem
        
        
//        btnBack.frame = CGRect(x: CGFloat(10), y: CGFloat(40), width: 30, height: 30)
//        btnBack.addTarget(self, action: #selector(clickBackDown), for: .touchUpInside)
//        btnBack.setImage(UIImage(named: "arrow@x-left"), for: .normal)
//        btnBack.backgroundColor = UIColor.black
//        view.addSubview(btnBack)
//
//        let Header: UILabel! = UILabel()
//        Header.frame = CGRect(x: btnBack.frame.maxX+10, y: 40, width: 150, height: 30)
//        Header.text = "Movies in Bengaluru"
//        Header.numberOfLines = 1
//        Header.backgroundColor = .clear
//        Header.textAlignment = .left
//        Header.textColor = .darkText
//        Header.font = UIFont(name: Header.font.fontName, size: 16)
//        view.addSubview(Header)
//
//        btnLocation.frame = CGRect(x: Header.frame.maxX+60, y: 40, width: 30, height: 30)
//        btnLocation.addTarget(self, action: #selector(clickLocation), for: .touchUpInside)
//        btnLocation.setImage(UIImage(named: "arrow@x-left"), for: .normal)
//        btnLocation.backgroundColor = UIColor.black
//        view.addSubview(btnLocation)
//
//        btnAdd.frame = CGRect(x: btnLocation.frame.maxX+10, y: 40, width: 30, height: 30)
//        btnAdd.addTarget(self, action: #selector(clickbtnLocation), for: .touchUpInside)
//        btnAdd.setImage(UIImage(named: "arrow@x-left"), for: .normal)
//        btnAdd.backgroundColor = UIColor.black
//        view.addSubview(btnAdd)
//
//        btnNotification.frame = CGRect(x: btnAdd.frame.maxX+10, y: 40, width: 30, height: 30)
//        btnNotification.addTarget(self, action: #selector(clickbtnNotification), for: .touchUpInside)
//        btnNotification.setImage(UIImage(named: "arrow@x-left"), for: .normal)
//        btnNotification.backgroundColor = UIColor.black
//        view.addSubview(btnNotification)
        
        
        uisetUpMenuCollection()
        uisetUpMainCollection()
        setupCollectionView()
        getRecords(isDeleted: false)
    }
    
    // MARK: - Find Network Connection Status
    func uiShowUpBadges() {
        
        let label = UILabel()
        label.textColor = UIColor.black
        label.text = "Movies in Bangaluru"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)
        
        
        let chatIcon: UIImage = UIImage(named: "icons")!
        let tintedchatIcon = chatIcon.withRenderingMode(.alwaysTemplate)
        chatButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        chatButton.setImage(tintedchatIcon, for: UIControl.State())
        chatButton.tintColor = .red
        chatButton.backgroundColor = UIColor.clear
        chatButton.addTarget(self, action: #selector(self.chat), for: .touchUpInside)
        let chatItem = UIBarButtonItem(customView: chatButton)

        let notiIcon: UIImage = UIImage(named: "notification")!
        let tintedncImage = notiIcon.withRenderingMode(.alwaysTemplate)
        notiButton.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(30), height: CGFloat(30))
        notiButton.setImage(tintedncImage, for: UIControl.State())
        
        let spacing: CGFloat! = 7;
        //notiButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -spacing);
        notiButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0);
        notiButton.tintColor = UIColor.black
        notiButton.addTarget(self, action: #selector(self.notification), for: .touchUpInside)
        let notiItem = UIBarButtonItem(customView:notiButton)
        
        let btnConsultFlow = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        btnConsultFlow.setImage(UIImage(named: "location")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btnConsultFlow.tintColor = UIColor.red
        btnConsultFlow.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -spacing);
        btnConsultFlow.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0);
        btnConsultFlow.addTarget(self, action: #selector(HomeViewController.showConsultationFlow), for: .touchUpInside)
//      chatButton.badgeValue = "0"
//      notiButton.bad = "0"
//      chatButton.badgeValue = "\(messageCount)"
        let consultationFlowItem = UIBarButtonItem(customView: btnConsultFlow)
        self.navigationItem.setRightBarButtonItems([notiItem,chatItem,consultationFlowItem], animated: false)
    }
    
    @objc func chat() {
//        let storyboard = UIStoryboard(name:"Hometabs",bundle:Bundle.main)
//        let webviewController = storyboard.instantiateViewController(withIdentifier: "MessageListController") as! MessageListController
//        navigationController?.pushViewController(webviewController, animated: true)
    }
    
    @objc func notification() {
//        let vc:NotificationListVC=NotificationListVC()
//        navigationController?.show(vc,sender:self);
    }
    
    @objc func showConsultationFlow() {
//        let controller =  ConsultationFlowViewController(nibName: "ConsultationFlowViewController", bundle: nil)
//        controller.delegate = self
//        navigationController?.present(controller, animated: true, completion: nil)
    }
    
    @objc func clickBackDown(sender: UIButton) {
   
    }
    
    @objc func clickLocation(sender: UIButton) {
      
    }
    
    @objc func clickbtnLocation(sender: UIButton) {
         
    }
    
    @objc func clickbtnNotification(sender: UIButton) {
         
    }
    
    func uisetUpMenuCollection() {
          collectionViewMenu = UICollectionView(frame: CGRect(x: CGFloat(0), y: CGFloat(70), width: CGFloat(view.frame.width), height: 75), collectionViewLayout: layoutMenu)
          collectionViewMenu.dataSource = self
          collectionViewMenu.dataSource = self
          collectionViewMenu.delegate = self
          collectionViewMenu.isScrollEnabled = true
          collectionViewMenu.isPagingEnabled = true
          collectionViewMenu.bounces = true
          layoutMenu.scrollDirection = .horizontal
          collectionViewMenu.backgroundColor = UIColor(red: 249.0/255.0, green: 249.0/255.0, blue: 249.0/255.0, alpha: 1.0)
          collectionViewMenu.showsHorizontalScrollIndicator = false
          collectionViewMenu.showsVerticalScrollIndicator = true
          layoutMenu.minimumInteritemSpacing = 0
          layoutMenu.minimumLineSpacing = 0
          collectionViewMain.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
          view.addSubview(collectionViewMenu)
         collectionViewMenu.register(UINib(nibName: "MenuBarCell", bundle: nil), forCellWithReuseIdentifier: cellMenuBarCellId)
         uisetReleasingDate()
    }
     func uisetReleasingDate() {
        let ReleasingDate: UILabel! = UILabel()
        ReleasingDate.frame = CGRect(x: 0, y: collectionViewMenu.frame.maxY+10, width: screenWidth, height: 40)
        ReleasingDate.text = "Releasing Date:14-06-2020"
        ReleasingDate.numberOfLines = 1
        ReleasingDate.backgroundColor = UIColor(red: 241.0/255.0, green: 241.0/255.0, blue: 241.0/255.0, alpha: 1.0)
        ReleasingDate.textAlignment = .center
        ReleasingDate.textColor = .darkText
        ReleasingDate.font = UIFont(name: ReleasingDate.font.fontName, size: 12)
        view.addSubview(ReleasingDate)
    }
    func uisetUpMainCollection() {
        layout = UICollectionViewFlowLayout()
        collectionViewMain = UICollectionView(frame: CGRect(x: CGFloat(0), y: CGFloat(collectionViewMenu.frame.maxY+60), width: CGFloat(view.frame.width), height: CGFloat(view.frame.height - (collectionViewMenu.frame.maxY+130))), collectionViewLayout: layout)
        collectionViewMain.dataSource = self
        collectionViewMain.dataSource = self
        collectionViewMain.delegate = self
        collectionViewMain.isScrollEnabled = true
        collectionViewMain.isPagingEnabled = true
        collectionViewMain.bounces = true
        layout.scrollDirection = .vertical
        collectionViewMain.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellIdentifier")
        collectionViewMain.backgroundColor = UIColor.clear
        collectionViewMain.showsHorizontalScrollIndicator = false
        collectionViewMain.showsVerticalScrollIndicator = true
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        view.addSubview(collectionViewMain)
       // collectionViewMain.contentInset = UIEdgeInsets(top:0, left: 0, bottom: 0, right: 0)
       // collectionViewMain.scrollIndicatorInsets = UIEdgeInsets(top:0, left: 0, bottom: 0, right: 0)
    }

    func setupCollectionView() {
        if let flowLayout = collectionViewMain.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .vertical
            flowLayout.minimumLineSpacing = 0
        }
        collectionViewMain.backgroundColor = UIColor.white
        collectionViewMain.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        //collectionViewMain.contentInset = UIEdgeInsets(top:0, left: -1, bottom: 0, right: 0)
        //collectionViewMain.scrollIndicatorInsets = UIEdgeInsets(top:0, left: -1, bottom: 0, right: 0)
        collectionViewMain.isPagingEnabled = true
    }
   // MARK: - API's
   func getRecords(isDeleted: Bool) {
       print("self.arrayMain:", self.arrayMain)
       self.array_selecteditems.removeAllObjects()
       if self.arrayMain.count > 0 {
           print("userNames[index]:", self.arrayMain[0])
           self.array_selecteditems.add(self.arrayMain[0])
           self.collectionViewMenu.reloadData()
       }
//       if isDeleted {
//           print("isDeleted", isDeleted)
//       } else {
//           print("isDeleted", isDeleted)
//           //self.reloadHeaderCollection()
//           self.reloadFirstMenuIndexData(menuIndex: 0)
//       }
       if self.arrayMain.count == 0 {
           self.collectionViewMain.reloadData()
           self.collectionViewMenu.reloadData()
           self.viewMessageBG.isHidden = false
           self.collectionViewMain.isHidden = true
           self.collectionViewMenu.isHidden = true
       } else {
           self.viewMessageBG.isHidden = true
           self.collectionViewMain.isHidden = false
           self.collectionViewMenu.isHidden = false
       }
       self.viewMessageBG.isHidden = true
      self.collectionViewMain.isHidden = false
            self.collectionViewMenu.isHidden = false
   }
   func reloadHeaderCollection() {
       print("userNames", self.arrayMain)
       if self.arrayMain.count > 0 {
           print("userNames[index]:", self.arrayMain[0])
           array_selecteditems.add(self.arrayMain[0])
       }
       collectionViewMenu.reloadData()
   }
    func scrollToMenuIndex(menuIndex: Int) {
//        DIProgressHud.show()
        reloadFirstMenuIndexData(menuIndex: menuIndex)
    }
    
    func reloadFirstMenuIndexData(menuIndex: Int) {
        print("menuIndex", menuIndex)
        self.selectedIndex = menuIndex
        UIView.animate(withDuration: 0, delay: 0, options: UIView.AnimationOptions.curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: { (completion) in
            
            let indexPath = IndexPath(item:menuIndex, section: 0)
            switch menuIndex {
            case 0:
                self.selectedAction = 0
                
                self.collectionViewMain.reloadData()
                self.collectionViewMain.scrollToItem(at: indexPath, at: .left, animated: true)
              //  DIProgressHud.hide()
                break
            case 1:
                self.selectedAction = 1
                
                
                //  self.apiCallFixtureMatch(textValue: "Fixture", menuIndex: menuIndex);
                
                break
            case 2:
                self.selectedAction = 2
                //  self.apiCallFixtureMatch(textValue: "Live", menuIndex: menuIndex);
                
                break
            case 3:
                self.selectedAction = 3
                break
            default:
                break
            }
            
        })
    }
    
    @objc func addRecord(_ sender: UIButton) {
        
    }
    
    // Keep last location with parameter
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
             switch velocity {
             case _ where velocity.y < 0:
                 // swipes from top to bottom of screen -> down
                 scrollDirection = .down
             case _ where velocity.y > 0:
                 // swipes from bottom to top of screen -> up
                 scrollDirection = .up
             default: scrollDirection = .none
             if arrayMain.count > 0 {
                 let index = Int(targetContentOffset.pointee.x / view.frame.width)
                 let indexPath = IndexPath(item: index, section: 0)
                 reloadCollectData(index: index)
                 reloadFirstMenuIndexData(menuIndex: index)
                 collectionViewMenu.selectItem(at: indexPath, animated: true, scrollPosition: .left)
                 }
             }
     }
    
    func reloadCollectData(index:Int)  {
        print("index:", index)
        array_selecteditems.removeAllObjects()
        if arrayMain.count > 0 {
            print("userNames[index]:", arrayMain[index])
            array_selecteditems.add(arrayMain[index])
            UIView.animate(withDuration: 0, delay: 0, options: UIView.AnimationOptions.curveEaseOut, animations: {
                self.view.layoutIfNeeded()
            }, completion: { (completion) in
                self.collectionViewMenu.reloadData()
            })
        }
    }
    func updateSelectedIndex(menuIndex: Int) {
        UIView.animate(withDuration: 0, delay: 0, options: UIView.AnimationOptions.curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: { (completion) in
            if menuIndex > 0 {
                let index = Int(menuIndex-1)
                let indexPath = IndexPath(item: index, section: 0)
                self.reloadCollectData(index: index)
                self.reloadFirstMenuIndexData(menuIndex: index)
                self.collectionViewMenu.selectItem(at: indexPath, animated: true, scrollPosition: .left)
            } else {
                let indexPath = IndexPath(item: 0, section: 0)
                self.reloadCollectData(index: 0)
                self.reloadFirstMenuIndexData(menuIndex: 0)
                self.collectionViewMenu.selectItem(at: indexPath, animated: true, scrollPosition: .left)
            }
        })
    }
    // MARK: -Collection Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionViewMain == collectionView {
            return 16
        } else {
            if arrayMain.count > 0 {
               return arrayMain.count
            }
        }
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionViewMain == collectionView {
                     let cell: UICollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: "cellIdentifier", for: indexPath)
              for view: UIView in (cell?.contentView.subviews)! {
                  view.removeFromSuperview()
              }
              let viewBG: UIView! = UIView()
              viewBG.frame = CGRect(x: 2, y:0, width: (cell?.frame.size.width)!-8, height: (cell?.frame.size.height)!-4)
              viewBG.backgroundColor = .white
              viewBG.layer.cornerRadius = 8
              viewBG.clipsToBounds = true
              cell?.contentView.addSubview(viewBG)
              
              let imageProduct: UIImageView! = UIImageView()
              imageProduct.frame = CGRect(x: 10, y: 10, width: viewBG.frame.size.width - 20, height: viewBG.frame.size.height - 100)
              imageProduct.image = UIImage(named: "imagegrid")
              imageProduct.contentMode = .scaleAspectFit
              imageProduct.backgroundColor = UIColor(red: 235.0/255.0, green: 235.0/255.0, blue: 235.0/255.0, alpha: 1)
              imageProduct.layer.cornerRadius = 6
              imageProduct.clipsToBounds = true;
             viewBG.addSubview(imageProduct)
            
             let likeButton = UIButton()
             likeButton.frame = CGRect(x: 4, y: imageProduct.frame.maxY+1, width: 25, height: 25)
             likeButton.setImage(UIImage(named: "like"), for: .normal)
             viewBG.addSubview(likeButton)

              let totalLike: UILabel! = UILabel()
              totalLike.frame = CGRect(x: likeButton.frame.maxX, y: imageProduct.frame.maxY+5, width: (imageProduct.frame.size.width/2 - likeButton.frame.maxX+2) , height: 20)
              totalLike.text = "2k"
              totalLike.numberOfLines = 1
              totalLike.backgroundColor = .clear
              totalLike.textAlignment = .left
              totalLike.textColor = .darkGray
              totalLike.font = UIFont(name: totalLike.font.fontName, size: 12)
              viewBG.addSubview(totalLike)
            
             let eyeButton = UIButton()
             eyeButton.frame = CGRect(x: totalLike.frame.maxX+4, y: imageProduct.frame.maxY+1, width: 25, height: 25)
             eyeButton.setImage(UIImage(named: "eye"), for: .normal)
             viewBG.addSubview(eyeButton)

             let totalWatch: UILabel! = UILabel()
             totalWatch.frame = CGRect(x: eyeButton.frame.maxX+1, y: imageProduct.frame.maxY+5, width: (imageProduct.frame.size.width/2 - likeButton.frame.maxX+2) , height: 20)
             totalWatch.text = "2k"
             totalWatch.numberOfLines = 1
             totalWatch.backgroundColor = .clear
             totalWatch.textAlignment = .left
             totalWatch.textColor = .darkGray
             totalWatch.font = UIFont(name: totalWatch.font.fontName, size: 12)
             viewBG.addSubview(totalWatch)
            
             let productType: UILabel! = UILabel()
             productType.frame = CGRect(x: 2, y: totalLike.frame.maxY+6, width: imageProduct.frame.size.width-4, height:50)
              productType.text = "Baaghi 3 (Hindi) 2D"
              productType.numberOfLines = 2
              productType.backgroundColor = .clear
              productType.textAlignment = .left
              productType.textColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1)
              productType.font = UIFont(name: productType.font.fontName, size: 16)
              viewBG.addSubview(productType)
            
           
            
            
            return cell ?? UICollectionViewCell()
        } else if collectionView == collectionViewMenu {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellMenuBarCellId, for: indexPath) as! MenuBarCell
            if arrayMain.count > 0 {
                cell.name.text = arrayMain[indexPath.row]
                if array_selecteditems.contains(arrayMain[indexPath.row]) {
                   cell.name.textColor = UIColor(red:255.0/255.0, green:255.0/255.0, blue:255.0/255.0,alpha:1.0)
                   cell.name.backgroundColor = UIColor(red: 218.0/255.0, green: 0.0/255.0, blue: 17.0/255.0,alpha:1.0)
                   cell.name.font = UIFont.boldSystemFont(ofSize: 12)
                   cell.underline.backgroundColor = UIColor(red: 218.0/255.0, green: 0.0/255.0, blue: 17.0/255.0,alpha:1.0)
                } else {
                   cell.name.textColor = UIColor.black
                   cell.name.backgroundColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0,alpha:1.0)
                   cell.underline.backgroundColor = UIColor.white
                }
                cell.name.font = UIFont(name: cell.name.font.fontName, size: 12)
            }
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collectionViewMenu {
            return CGSize(width: self.view.frame.width/3, height: 36)
        } else {
//            let maincollHeight:CGFloat = (self.view.frame.height - ())
            return CGSize(width: self.view.frame.width/3.2, height: 220)
        }
    }
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
         if collectionView == collectionViewMenu {
                return 1
         } else {
                 return 0
         }
      }
      
    
      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
         
         if collectionView == collectionViewMenu {
            return 1
         }  else {
           return 0
        }
      }
    
      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == collectionViewMenu {
           return UIEdgeInsets(top: 0, left: 4, bottom: 7, right: 2)
        } else {
           return UIEdgeInsets(top: 0, left: 4, bottom: 7, right: 2)
        }
        
      }

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == collectionViewMenu {
            array_selecteditems.removeAllObjects()
            if arrayMain.count > 0 {
                if !array_selecteditems.contains(arrayMain[indexPath.row]) {
                    array_selecteditems.add(arrayMain[indexPath.row])
                } else {
                    array_selecteditems.remove(arrayMain[indexPath.row])
                }
                print("array_selecteditems:", array_selecteditems)
                collectionView.reloadData();
            }
            scrollToMenuIndex(menuIndex: indexPath.item)
        }
    }

}
