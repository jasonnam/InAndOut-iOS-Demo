//
//  MainViewController.swift
//  InAndOut
//
//  Created by Jason Nam on 2015. 9. 6..
//  Copyright (c) 2015년 Jason Nam. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController {
    @IBOutlet private weak var logo: UIImageView! = nil
    @IBOutlet private weak var visitWebsiteButton: UIButton! = nil
    @IBOutlet private weak var signOutButton: UIButton! = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        logo.alpha = 0
        visitWebsiteButton.alpha = 0
        signOutButton.alpha = 0
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        UIView.animate(withDuration: 0.4, delay: 0, options: UIViewAnimationCurve.easeIn.options, animations: {
            self.logo.alpha = 1
        }, completion: { finished in
            if finished {
                self.showVisitWebsiteButton()
            }
        })
    }

    private func showVisitWebsiteButton() {
        UIView.animate(withDuration: 0.2, delay: 0, options: UIViewAnimationCurve.easeIn.options, animations: {
            self.visitWebsiteButton.alpha = 1
        }, completion: { finished in
            if finished {
                self.showSignOutButton()
            }
        })
    }

    private func showSignOutButton() {
        UIView.animate(withDuration: 0.2, delay: 0, options: UIViewAnimationCurve.easeIn.options, animations: {
            self.signOutButton.alpha = 1
        }, completion: nil)
    }

    @IBAction func trySignOut() {
        AuthManager.signOut()
        (UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController = storyboard?.instantiateViewController(withIdentifier: "SignInViewController") as? SignInViewController
    }

    @IBAction func visitWebsite() {
        if let URL = URL(string: "http://www.jasonnam.com") {
            UIApplication.shared.openURL(URL)
        }
    }
}
