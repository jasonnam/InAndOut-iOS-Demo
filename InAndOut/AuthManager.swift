//
//  AuthManager.swift
//  InAndOut
//
//  Created by Jason Nam on 2015. 9. 6..
//  Copyright (c) 2015년 Jason Nam. All rights reserved.
//

import Foundation

final class AuthManager {

    private static let signInKey = "SIGNIN"

    static var signedIn: Bool {
        return UserDefaults.standard.bool(forKey: signInKey)
    }

    static func signIn() {
        UserDefaults.standard.set(true, forKey: signInKey)
    }

    static func signOut() {
        UserDefaults.standard.set(false, forKey: signInKey)
    }
}
