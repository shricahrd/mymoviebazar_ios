//
//  MovieShowTime.swift
//  MyMovieBazar
//
//  Created by RAKESH KUSHWAHA on 12/07/20.
//  Copyright © 2020 rakesh. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
class MovieShowTime: UIViewController,UIScrollViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, CLLocationManagerDelegate, MKMapViewDelegate {
    var btnBack = UIButton()
    var btnLocation = UIButton()
    var btnAdd = UIButton()
    var btnNotification = UIButton()
    let cellId = "cellId"
    let cellMenuBarCellId = "MenuBarCell"
    var screenSize:CGRect = UIScreen.main.bounds
    var screenWidth:CGFloat = 0.0
    var screenHeight:CGFloat = 0.0
    var layout = UICollectionViewFlowLayout()
    var collectionViewMain = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    var arrayMain = ["RELEASING THIS WEEK","RUNNING SUCCESSFULLY","COMMING SOON"]
    var layout1 = UICollectionViewFlowLayout()
    var collectionViewMain1 = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    let records = NSMutableArray()
    var selectedIndex = 0
    let tagForPlaceHolder = 100
    var lastContentOffset: CGFloat = 0
    var array_selecteditems = NSMutableArray()
    var viewMessageBG = UIView()
    var viewBG1 = UIView()
    var viewBG2 = UIView()
    var selectedAction = 0
    var label = UILabel()
    var lblTheater = UILabel()
    var scrollViewMain = UIScrollView()
    var  theaterName = UILabel()

    enum ScrollDirection {
        case up, down, none
    }
    
    private var scrollDirection: ScrollDirection = .up
    let chatButton = UIButton()
    let notiButton = UIButton()
    let networkErrorButton = UIButton()
    var myCollectionViewHeight: NSLayoutConstraint!
    var map: MKMapView!
 
    private var currentLocation: CLLocation?
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 241.0/255.0, green: 241.0/255.0, blue: 241.0/255.0, alpha: 1.0)
        self.screenWidth = screenSize.width
        self.screenHeight = screenSize.height
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        uiShowUpBadges()
    }
   
    // MARK: - Find Network Connection Status
    func uiShowUpBadges() {
        
        label = UILabel()
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
        uisetlblTheater()
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
    
     func uisetlblTheater() {
        viewBG1 = UIView()
        viewBG1.frame = CGRect(x: 0, y: notiButton.frame.maxY+60, width: screenWidth, height: 60)
        viewBG1.backgroundColor = .white
        view.addSubview(viewBG1)

        lblTheater = UILabel()
        lblTheater.frame = CGRect(x: 10, y: 0, width: screenWidth-20, height: 40)
        lblTheater.text = "Santosh Theater,KC Road"
        lblTheater.numberOfLines = 1
        lblTheater.backgroundColor = UIColor.clear
        lblTheater.textAlignment = .left
        lblTheater.textColor = .darkText
        lblTheater.font = UIFont(name: lblTheater.font.fontName, size: 12)
        viewBG1.addSubview(lblTheater)
        
         
        let imageStar: UIImageView! = UIImageView()
        imageStar.frame = CGRect(x: 10, y: lblTheater.frame.maxY, width: 10, height: 10)
        imageStar.image = UIImage(named: "imagegrid")
        imageStar.contentMode = .scaleAspectFit
        imageStar.backgroundColor = UIColor(red: 235.0/255.0, green: 235.0/255.0, blue: 235.0/255.0, alpha: 1)
        imageStar.layer.cornerRadius = 10/2
        imageStar.clipsToBounds = true;
        viewBG1.addSubview(imageStar)
        
         
        let imageStar1: UIImageView! = UIImageView()
        imageStar1.frame = CGRect(x: imageStar.frame.maxX+5, y: lblTheater.frame.maxY, width: 10, height: 10)
        imageStar1.image = UIImage(named: "imagegrid")
        imageStar1.contentMode = .scaleAspectFit
        imageStar1.backgroundColor = UIColor(red: 235.0/255.0, green: 235.0/255.0, blue: 235.0/255.0, alpha: 1)
        imageStar1.layer.cornerRadius = 10/2
        imageStar1.clipsToBounds = true;
        viewBG1.addSubview(imageStar1)
        
         
         let imageStar2: UIImageView! = UIImageView()
         imageStar2.frame = CGRect(x: imageStar1.frame.maxX+5, y: lblTheater.frame.maxY, width: 10, height: 10)
         imageStar2.image = UIImage(named: "imagegrid")
         imageStar2.contentMode = .scaleAspectFit
         imageStar2.backgroundColor = UIColor(red: 235.0/255.0, green: 235.0/255.0, blue: 235.0/255.0, alpha: 1)
         imageStar2.layer.cornerRadius = 10/2
         imageStar2.clipsToBounds = true;
         viewBG1.addSubview(imageStar2)
        
         
          
         let imageStar3: UIImageView! = UIImageView()
         imageStar3.frame = CGRect(x: imageStar2.frame.maxX+5, y: lblTheater.frame.maxY, width: 10, height: 10)
         imageStar3.image = UIImage(named: "imagegrid")
         imageStar3.contentMode = .scaleAspectFit
         imageStar3.backgroundColor = UIColor(red: 235.0/255.0, green: 235.0/255.0, blue: 235.0/255.0, alpha: 1)
         imageStar3.layer.cornerRadius = 10/2
         imageStar3.clipsToBounds = true;
         viewBG1.addSubview(imageStar3)
        
         
         let imageStar4: UIImageView! = UIImageView()
         imageStar4.frame = CGRect(x: imageStar3.frame.maxX+5, y: lblTheater.frame.maxY, width: 10, height: 10)
         imageStar4.image = UIImage(named: "imagegrid")
         imageStar4.contentMode = .scaleAspectFit
         imageStar4.backgroundColor = UIColor(red: 235.0/255.0, green: 235.0/255.0, blue: 235.0/255.0, alpha: 1)
         imageStar4.layer.cornerRadius = 10/2
         imageStar4.clipsToBounds = true;
         viewBG1.addSubview(imageStar4)
         uisetUpMainScroll()
    }
    
    func uisetUpMainScroll() {
        scrollViewMain.frame = CGRect(x: 0, y: viewBG1.frame.maxY+10, width: screenWidth, height: screenHeight)
        scrollViewMain.bounces=true
        scrollViewMain.delegate=self
        scrollViewMain.backgroundColor=UIColor.clear
        scrollViewMain.clipsToBounds = true
        view.addSubview(scrollViewMain)
        scrollViewMain.contentSize = CGSize(width: 0, height: view.frame.maxY + 800)
        uisetUpMainCollection()
    }
    
    func uisetUpMainCollection() {
        layout = UICollectionViewFlowLayout()
        collectionViewMain = UICollectionView(frame: CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(view.frame.width), height: CGFloat(370)), collectionViewLayout: layout)
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
        scrollViewMain.addSubview(collectionViewMain)
        //setupCollectionView1()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        calculateheight()
        calculateheight1()
    }
    
    func calculateheight() {
        var total:CGFloat = CGFloat(10/3)
        total += 1
        let count:CGFloat = CGFloat(total)
        let heightCell: CGFloat = CGFloat(180*count)
        collectionViewMain.frame = CGRect(x: 0, y: 0, width: CGFloat(view.frame.width), height: heightCell) // swift
        self.showTheaterTitle()
    }
    
    
    func showTheaterTitle() {
         theaterName = UILabel()
        theaterName.frame = CGRect(x: 10, y: collectionViewMain.frame.maxY+5, width: screenWidth-20, height: 40)
         theaterName.text = "THeater Photos"
         theaterName.numberOfLines = 1
         theaterName.backgroundColor = UIColor.clear
         theaterName.textAlignment = .left
         theaterName.textColor = .darkText
         theaterName.font = UIFont(name: theaterName.font.fontName, size: 14)
         scrollViewMain.addSubview(theaterName)
        setupCollectionView1()
    }
    
     func setupCollectionView1() {
          viewBG2 = UIView()
          viewBG2.frame = CGRect(x: 0, y: theaterName.frame.maxY+5, width: screenWidth, height: 200)
          viewBG2.backgroundColor = .clear
          scrollViewMain.addSubview(viewBG2)
         
          layout1 = UICollectionViewFlowLayout()
          collectionViewMain1 = UICollectionView(frame: CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(view.frame.width), height: CGFloat(200)), collectionViewLayout: layout1)
          collectionViewMain1.dataSource = self
          collectionViewMain1.dataSource = self
          collectionViewMain1.delegate = self
          collectionViewMain1.isScrollEnabled = true
          collectionViewMain1.isPagingEnabled = true
          collectionViewMain1.bounces = true
          layout1.scrollDirection = .vertical
          collectionViewMain1.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
          collectionViewMain1.backgroundColor = UIColor.clear
          collectionViewMain1.showsHorizontalScrollIndicator = false
          collectionViewMain1.showsVerticalScrollIndicator = true
          layout1.minimumInteritemSpacing = 0
          layout1.minimumLineSpacing = 0
          viewBG2.addSubview(collectionViewMain1)

          callMap()
     }
    
    func calculateheight1() {
         var total:CGFloat = CGFloat(6/3)
         total += 1
         let count:CGFloat = CGFloat(total)
         let heightCell: CGFloat = CGFloat(135*count)
         viewBG2.frame = CGRect(x: 0, y: theaterName.frame.maxY+5, width: screenWidth, height: heightCell)
         collectionViewMain1.frame = CGRect(x: 0, y: 0, width: CGFloat(view.frame.width), height: heightCell) // swift
     }
    
    func callMap() {
         map = MKMapView()
         map.frame = CGRect(x: CGFloat(0), y: CGFloat(viewBG2.frame.maxY+10), width: CGFloat(view.frame.width), height: CGFloat(200))
         map.delegate = self
         map.mapType = .standard
         map.isZoomEnabled = true
         map.isScrollEnabled = true
         if let coor = map.userLocation.location?.coordinate{
             map.setCenter(coor, animated: true)
         }
        scrollViewMain.addSubview(map)
        
         let movieticketbooking = UILabel()
         movieticketbooking.frame = CGRect(x: 10, y: map.frame.maxY+15, width: screenWidth-20, height: 20)
         movieticketbooking.text = "My Movie Ticket Booking"
         movieticketbooking.numberOfLines = 1
         movieticketbooking.backgroundColor = UIColor.clear
         movieticketbooking.textAlignment = .left
         movieticketbooking.textColor = .black
         movieticketbooking.font = UIFont(name: movieticketbooking.font.fontName, size: 14)
         scrollViewMain.addSubview(movieticketbooking)
        
         let movieticketlink = UILabel()
         movieticketlink.frame = CGRect(x: 10, y: movieticketbooking.frame.maxY, width: screenWidth-20, height: 20)
         movieticketlink.text = "https://g.co/mo451c"
         movieticketlink.numberOfLines = 1
         movieticketlink.backgroundColor = UIColor.clear
         movieticketlink.textAlignment = .left
         movieticketlink.textColor = .red
         movieticketlink.font = UIFont(name: movieticketlink.font.fontName, size: 14)
         scrollViewMain.addSubview(movieticketlink)
    }
    
    
    
    // MARK - CLLocationManagerDelegate

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        defer { currentLocation = locations.last }
        if currentLocation == nil {
            // Zoom to user location
            if let userLocation = locations.last {
                let viewRegion = MKCoordinateRegion(center: userLocation.coordinate, latitudinalMeters: 2000, longitudinalMeters: 2000)
                map.setRegion(viewRegion, animated: false)
            }
        }
    }
    
    func setupCollectionView() {
        if let flowLayout = collectionViewMain.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .vertical
            flowLayout.minimumLineSpacing = 0
        }
        collectionViewMain.backgroundColor = UIColor.green
        collectionViewMain.isPagingEnabled = true
    }

    // MARK: -Collection Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionViewMain == collectionView {
            return 10
        } else {
            if arrayMain.count > 0 {
               return 6
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
              viewBG.frame = CGRect(x: 2, y:5, width: (cell?.frame.size.width)!-8, height: (cell?.frame.size.height)!-4)
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
        } else {
            let cell: UICollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
            for view: UIView in (cell?.contentView.subviews)! {
                     view.removeFromSuperview()
            }
            let viewBG: UIView! = UIView()
            viewBG.frame = CGRect(x: 2, y:5, width: (cell?.frame.size.width)!-8, height: (cell?.frame.size.height)!-4)
            viewBG.backgroundColor = .white
            viewBG.layer.cornerRadius = 8
            viewBG.clipsToBounds = true
            cell?.contentView.addSubview(viewBG)
                 
            let imageProduct: UIImageView! = UIImageView()
            imageProduct.frame = CGRect(x: 0, y: 0, width: viewBG.frame.size.width, height: viewBG.frame.size.height)
            imageProduct.image = UIImage(named: "imagegrid")
            imageProduct.contentMode = .scaleAspectFit
            imageProduct.backgroundColor = UIColor(red: 235.0/255.0, green: 235.0/255.0, blue: 235.0/255.0, alpha: 1)
            imageProduct.layer.cornerRadius = 6
            imageProduct.clipsToBounds = true;
            viewBG.addSubview(imageProduct)
            
            return cell ?? UICollectionViewCell()
            
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionViewMain == collectionView {
           return CGSize(width: self.view.frame.width/3.2, height: 180)
        } else {
           return CGSize(width: self.view.frame.width/3.2, height: 110)
        }
        
    }
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
       
                 return 0
      }
      
    
      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
           return 0
      }
    
      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
               return UIEdgeInsets(top: 0, left: 4, bottom: 7, right: 2)
      }

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }

}
