//
//  SignInViewController.swift
//  InAndOut
//
//  Created by Jason Nam on 2015. 9. 6..
//  Copyright (c) 2015년 Jason Nam. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController
{
    @IBOutlet weak var logoAlignCenterY: NSLayoutConstraint! = nil
    @IBOutlet weak var logoText: UILabel! = nil
    
    @IBOutlet weak var signInButton: UIButton! = nil
    @IBOutlet weak var signInIndicator: UIActivityIndicatorView! = nil
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        logoText.alpha = 0

        signInButton.alpha = 0
    }
    
    override func viewDidAppear(animated: Bool)
    {
        super.viewDidAppear(true)
        
        self.logoAlignCenterY.constant = 60
        
        UIView.animateWithDuration(0.5, delay: 0, options: UIViewAnimationCurve.EaseOut.toOptions(), animations: {
        
                self.view.layoutIfNeeded()
        
            }, completion: { (finished: Bool) in
                
                if finished
                {
                    self.showLogoTextAndButton()
                }
        
            })
    }
    
    private func showLogoTextAndButton()
    {
        UIView.animateWithDuration(0.5, delay: 0, options: UIViewAnimationCurve.EaseIn.toOptions(), animations: {
            
                self.logoText.alpha = 1
                self.signInButton.alpha = 1
        
            }, completion: nil)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func trySignIn()
    {
        signInButton.alpha = 0
        signInIndicator.startAnimating()
        
        NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: "signInSucceeded", userInfo: nil, repeats: false)
    }
    
    func signInSucceeded()
    {
        AuthManager.signIn()
        
        (UIApplication.sharedApplication().delegate as! AppDelegate).window?.rootViewController = storyboard?.instantiateInitialViewController() as! MainViewController
    }
}

extension UIViewAnimationCurve
{
    func toOptions() -> UIViewAnimationOptions
    {
        return UIViewAnimationOptions(rawValue: UInt(rawValue << 16))
    }
}