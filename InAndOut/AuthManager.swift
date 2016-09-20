//
//  AuthManager.swift
//  InAndOut
//
//  Created by Jason Nam on 2015. 9. 6..
//  Copyright (c) 2015년 Jason Nam. All rights reserved.
//

import Foundation

final class AuthManager {
    private static var userDefaults = UserDefaults.standard
    private static let signInKey = "SIGNIN"

    class var signedIn: Bool {
        return userDefaults.bool(forKey: signInKey)
    }

    class func signIn() {
        userDefaults.set(true, forKey: signInKey)
    }

    class func signOut() {
        userDefaults.set(false, forKey: signInKey)
    }
}
