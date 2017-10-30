//
//  ViewController.swift
//  iBeacon
//
//  Created by mitake on 2017/10/30.
//  Copyright © 2017 mitake. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    var locationManager: CLLocationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        //        locationManager.requestAlwaysAuthorization()
        //        locationManager.delegate = self
        //        let region: CLBeaconRegion = CLBeaconRegion(proximityUUID: UUID(uuidString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D")!, identifier: "Beacon USB")
        //        locationManager.startRangingBeacons(in: region)
    }

    func locationManager(_: CLLocationManager, didChangeAuthorization _: CLAuthorizationStatus) {
    }

    func locationManager(_: CLLocationManager, didRangeBeacons beaconsArr: [CLBeacon], in _: CLBeaconRegion) {
        print(beaconsArr)
    }

    func locationManager(_: CLLocationManager, didExitRegion _: CLRegion) {
        print("exit")
    }

    func locationManager(_: CLLocationManager, didEnterRegion _: CLRegion) {
        print("enter")
    }
}
