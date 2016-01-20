//
//  AppDelegate.swift
//  InAndOut
//
//  Created by Jason Nam on 2015. 9. 6..
//  Copyright (c) 2015년 Jason Nam. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        if !AuthManager.isSignedIn() {
            window?.rootViewController = storyboard.instantiateViewControllerWithIdentifier("SignInViewController") as! SignInViewController
        }

        return true
    }
}
