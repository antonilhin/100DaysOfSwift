//
//  ViewController.swift
//  Project22
//
//  Created by Antoni on 31/07/19.
//  Copyright © 2019 Antoni. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet var distanceReading: UILabel!
    var isFirstDetect = false
    var locationManager: CLLocationManager?
    
    @IBOutlet var circleView: UIView!
    @IBOutlet var CircleDiameter: NSLayoutConstraint!
    
    
    @IBOutlet var Position: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
        
        view.backgroundColor = .gray
        
        circleView.layer.masksToBounds = true
        circleView.layer.cornerRadius = 50.0
        circleView.isHidden = true
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable(){
                    startScanning()
                }
            }
        }
    }
    
    func startScanning() {
        let uuid = UUID(uuidString: "5A4BCFCE-174E-4BAC-A814-092E77F6B7E5")!
        let beaconRegion = CLBeaconRegion(proximityUUID: uuid, major: 123, minor: 456, identifier: "MyBeacon")
        
        locationManager?.startMonitoring(for: beaconRegion)
        locationManager?.startRangingBeacons(in: beaconRegion)
    }
    
    func update(distance: CLProximity) {
        UIView.animate(withDuration: 0.8) {
            switch distance {
            case .far:
                self.view.backgroundColor = .blue
                self.distanceReading.text = "FAR"
                self.Position.constant = 0
                self.CircleDiameter.constant = 100
                self.circleView.layer.cornerRadius = 50.0
                self.circleView.isHidden = false
            case .near:
                self.view.backgroundColor = .orange
                self.distanceReading.text = "NEAR"
                self.Position.constant = (UIScreen.main.bounds.height/6) - 50
                self.CircleDiameter.constant = 150
                self.circleView.layer.cornerRadius = 75.0
                self.circleView.isHidden = false
            case .immediate:
                self.view.backgroundColor = .white
                self.distanceReading.text = "RIGHT HERE"
                self.Position.constant = ((UIScreen.main.bounds.height/6) * 2) - 20
                self.CircleDiameter.constant = 200
                self.circleView.layer.cornerRadius = 100.0
                self.circleView.isHidden = false
            default:
                self.view.backgroundColor = .lightGray
                self.distanceReading.text = "UNKNOWN"
                self.circleView.isHidden = true
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        print("\(beacons)")
        if let beacon = beacons.first {
            update(distance: beacon.proximity)
            if !isFirstDetect {
                isFirstDetect = true
                let ac = UIAlertController(title: "Beacon detected!", message: nil, preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                present(ac, animated: true, completion: nil)
            }
        } else {
            update(distance: .unknown)
        }
    }


}

