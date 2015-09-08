//
//  MainViewController.swift
//  InAndOut
//
//  Created by Jason Nam on 2015. 9. 6..
//  Copyright (c) 2015년 Jason Nam. All rights reserved.
//

import UIKit

class MainViewController: UIViewController
{
    @IBOutlet weak var logo: UIImageView! = nil
    @IBOutlet weak var visitWebsiteButton: UIButton! = nil
    @IBOutlet weak var signOutButton: UIButton! = nil
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        logo.alpha = 0
        visitWebsiteButton.alpha = 0
        signOutButton.alpha = 0
    }
    
    override func viewDidAppear(animated: Bool)
    {
        super.viewDidAppear(true)
        
        UIView.animateWithDuration(0.4, delay: 0, options: UIViewAnimationCurve.EaseIn.toOptions(), animations: {
            
                self.logo.alpha = 1
            
            }, completion: { (finished: Bool) in
                
                if finished
                {
                    self.showVisitWebsiteButton()
                }
                
            })
    }
    
    private func showVisitWebsiteButton()
    {
        UIView.animateWithDuration(0.2, delay: 0, options: UIViewAnimationCurve.EaseIn.toOptions(), animations: {
            
            self.visitWebsiteButton.alpha = 1
            
            }, completion: { (finished: Bool) in
                
                if finished
                {
                    self.showSignOutButton()
                }
                
            })
    }
    
    private func showSignOutButton()
    {
        UIView.animateWithDuration(0.2, delay: 0, options: UIViewAnimationCurve.EaseIn.toOptions(), animations: {
            
                self.signOutButton.alpha = 1
            
            }, completion: nil)
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func trySignOut()
    {
        AuthManager.signOut()
        
        (UIApplication.sharedApplication().delegate as! AppDelegate).window?.rootViewController = storyboard?.instantiateViewControllerWithIdentifier("SignInViewController") as! SignInViewController
    }
    
    @IBAction func visitWebsite()
    {
        UIApplication.sharedApplication().openURL(NSURL(string: "http://www.jasonnam.com")!)
    }
}