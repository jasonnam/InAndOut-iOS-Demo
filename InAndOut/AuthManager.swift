//
//  AuthManager.swift
//  InAndOut
//
//  Created by Jason Nam on 2015. 9. 6..
//  Copyright (c) 2015년 Jason Nam. All rights reserved.
//

import Foundation

class AuthManager {
    private static var userDefaults = NSUserDefaults.standardUserDefaults()
    private static let signInKey = "SIGNIN"

    class func isSignedIn() -> Bool {
        return userDefaults.boolForKey(signInKey)
    }

    class func signIn() {
        userDefaults.setBool(true, forKey: signInKey)
    }

    class func signOut() {
        userDefaults.setBool(false, forKey: signInKey)
    }
}
