//
//  SignInViewController.swift
//  InAndOut
//
//  Created by Jason Nam on 2015. 9. 6..
//  Copyright (c) 2015년 Jason Nam. All rights reserved.
//

import UIKit

final class SignInViewController: UIViewController {

    @IBOutlet private weak var logoAlignCenterY: NSLayoutConstraint!
    @IBOutlet private weak var logoText: UILabel!
    @IBOutlet private weak var signInButton: UIButton!
    @IBOutlet private weak var signInIndicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        logoText.alpha = 0
        signInButton.alpha = 0
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        logoAlignCenterY.constant = 60

        UIView.animate(withDuration: 0.5, delay: 0, options: UIViewAnimationCurve.easeOut.options, animations: {
            self.view.layoutIfNeeded()
        }, completion: { finished in
            guard finished else {
                return
            }

            UIView.animate(withDuration: 0.5, delay: 0, options: UIViewAnimationCurve.easeIn.options, animations: {
                self.logoText.alpha = 1
                self.signInButton.alpha = 1
            }, completion: nil)
        })
    }

    @IBAction func trySignIn() {
        signInButton.alpha = 0
        signInIndicator.startAnimating()

        Timer.scheduledTimer(timeInterval: 2,
                             target: self,
                             selector: #selector(signInSucceeded),
                             userInfo: nil,
                             repeats: false)
    }

    @objc func signInSucceeded() {
        AuthManager.signIn()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = storyboard?.instantiateInitialViewController() as! MainViewController
    }
}
