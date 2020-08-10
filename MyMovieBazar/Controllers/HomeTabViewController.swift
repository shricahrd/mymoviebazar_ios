// HomeTabViewController.swift
// PatientAppNew
// Created by Doctor Insta on 27/01/17.
// Copyright © 2017 Doctor Insta. All rights reserved.

import UIKit
import CoreLocation
class HomeTabViewController: UITabBarController, CLLocationManagerDelegate {
    var locationManager: CLLocationManager = CLLocationManager()
    var rateSchedudeInfo: [String: Any]?
    var isContinueOffline = false
    //MARK: - Lifecycle functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        SetupLocationManager()
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }

    func SetupLocationManager() {
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func tabWillAppear(_ index: Int) {
        updateBadgeValues()
    }
    
    func updateBadgeValues() {
       /*
        if let messageCount = Int(getPubnubMessagesCount()), let notificationCount = Int(getNotificationCountUD()) {
            let totalCount = messageCount + notificationCount
            if totalCount > 0 {
                tabBar.items?[TabIndex.health].badgeValue = "\(totalCount)"
            } else {
                tabBar.items?[TabIndex.health].badgeValue = nil
            }
        }
         */
    }
    
    //MARK: - Location Delegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if locations.count > 0 {
            let location: CLLocation = locations[locations.count - 1]
            locationManager.stopUpdatingLocation()
        }
    }
}
