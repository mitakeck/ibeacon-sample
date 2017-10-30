//
//  AppDelegate.swift
//  iBeacon
//
//  Created by mitake on 2017/10/30.
//  Copyright © 2017 mitake. All rights reserved.
//

import UIKit
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, CLLocationManagerDelegate {

    var window: UIWindow?
    var locationManager = CLLocationManager()

    internal func application(_: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self

        let region: CLBeaconRegion = CLBeaconRegion(proximityUUID: UUID(uuidString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D")!, identifier: "Beacon USB")
        locationManager.startRangingBeacons(in: region)

        if launchOptions?[UIApplicationLaunchOptionsKey.location] != nil {
            print("Launched with UIApplicationLaunchOptionsKey.location")
            locationManager.startMonitoringSignificantLocationChanges()
        }
        return true
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

    internal func applicationDidEnterBackground(_: UIApplication) {
        print("DidEnterBackground")
        if CLLocationManager.significantLocationChangeMonitoringAvailable() {
            locationManager.startMonitoringSignificantLocationChanges()
        }
    }

    func locationManager(_: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("DidUpdateLocations")
        print(locations)
    }

    func applicationWillResignActive(_: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationWillEnterForeground(_: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}
