//
//  AppDelegate.swift
//  AsyncDisplayKit-Demo
//
//  Created by Yang, Tyler on 9/26/16.
//  Copyright © 2016 Cincas. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        let viewController = UIViewController()
        
        window?.rootViewController = viewController
        
        window?.makeKeyAndVisible()
        
        viewController.presentViewController(ViewController(), animated: true, completion: nil)
        return true
    }
}

