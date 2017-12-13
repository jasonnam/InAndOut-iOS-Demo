<p align="center">
  <img src="LOGO.png" title="In And Out logo" float=left height="120px" width="120px">
</p>

# In And Out

**iOS demo app for signing in and signing out**

<img src="SCREENSHOT.gif" title="Screen Shot" width="240px">

## Key points

### Manage sign in out state with a class

This class has three methods.
- Check the current state
- Change the state to 'Signed In'
- Change the state to 'Signed Out'

```swift

//  AuthManager.swift
//  InAndOut

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

```

This app uses UserDefaults to save the status. But in many cases, it is recommanded to use [iOS Keychain Services](https://developer.apple.com/library/mac/documentation/Security/Conceptual/keychainServConcepts/iPhoneTasks/iPhoneTasks.html) to keep important data.
> Why not check this awesome iOS Keychain wrapper project? [Locksmith](https://github.com/matthewpalmer/Locksmith)

### Check initial view controller

When the app is launched following method is executed while showing splash view on the screen.

```swift

//  AppDelegate.swift
//  InAndOut

func application(_ application: UIApplication,
                 didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    if !AuthManager.signedIn {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        window?.rootViewController
            = storyboard.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
    }

    return true
}

```

> In Storyboard, main view controller is set to Initial View Controller and sign in view controller's Storyboard identifier is "SignInViewController".

This method check the status and change the rootViewController property of window object. Therefore depending on the status initial view controller shown right after splash screen can be chosen in right timing.

### Signing out

Signing out is very easy. Just change the status to signed out and set the rootViewController.

```swift

//  MainViewController.swift
//  InAndOut

@IBAction func trySignOut() {
    AuthManager.signOut()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    appDelegate.window?.rootViewController = storyboard?.instantiateViewController(withIdentifier: "SignInViewController") as? SignInViewController
}

```

## Feedback
You can clone this project and build it on your own!
If you have any other ideas and something to talk on this project feel free to contact me.

Jason Nam<br>[Website](http://jasonnam.com)<br>[Email](mailto:contact@jasonnam.com)
