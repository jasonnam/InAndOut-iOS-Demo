//
//  AppDelegate.swift
//  InAndOut
//
//  Created by Jason Nam on 2015. 9. 6..
//  Copyright (c) 2015년 Jason Nam. All rights reserved.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        if !AuthManager.signedIn {
            window?.rootViewController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SignInViewController") as? SignInViewController
        }

        return true
    }
}
