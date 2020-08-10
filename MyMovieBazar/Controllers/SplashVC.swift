//
//  SplashVC.swift
//  MyMovieBazar
//
//  Created by RAKESH KUSHWAHA on 11/07/20.
//  Copyright © 2020 rakesh. All rights reserved.
//

import UIKit

class SplashVC: UIViewController {
@IBOutlet weak var splashImageView: UIImageView!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.setSplashImage()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(true)
          self.navigationController?.setNavigationBarHidden(true, animated: false)
        _ = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(SplashVC.timeToMoveOn), userInfo: nil, repeats: false)
    }
        
    func setSplashImage() {
       // splashImageView.image = UIImage(named: "Welcome.jpg")
    }
    
    @objc func timeToMoveOn() {
       self.moveToHomeAndLogin()
    }
    
    func moveToHomeAndLogin() {
        let storyboard1 = UIStoryboard(name:"Main",bundle:Bundle.main)
        let homeTabViewController = storyboard1.instantiateViewController(withIdentifier: "HomeTabViewController") as! HomeTabViewController;
        homeTabViewController.isContinueOffline = true
        self.navigationController?.show(homeTabViewController, sender: self);
    }
    
    func showOnSplashAlertView(title:String,message:String,actions:[UIAlertAction],preferredStyle:UIAlertController.Style = .alert,viewController:UIViewController?) -> Void {
          let alertController = UIAlertController(title: title, message:message, preferredStyle: preferredStyle)
          if actions.isEmpty {
              alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action: UIAlertAction!) in
                  self.dismiss(animated: true, completion: nil)
              }))
          }else{
              for action in actions {
                  alertController.addAction(action)
              }
          }
          self.present(alertController, animated: true, completion: nil)
      }

}
