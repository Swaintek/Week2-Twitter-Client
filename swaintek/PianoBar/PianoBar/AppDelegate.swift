//
//  AppDelegate.swift
//  PianoBar
//
//  Created by David Swaintek on 6/13/16.
//  Copyright © 2016 David Swaintek. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let cache = Cache<UIImage>(size: 100)


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
}

