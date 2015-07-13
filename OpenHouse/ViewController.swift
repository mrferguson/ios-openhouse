//
//  ViewController.swift
//  OpenHouse
//
//  Created by Edward Yeh on 7/13/15.
//  Copyright (c) 2015 Edward Yeh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        var screenSize = UIScreen.mainScreen().bounds
        
        super.viewDidLoad()
        
        let title = UILabel(frame: CGRectMake(0, screenSize.height * 0.3, screenSize.width, 50))
        title.text = "Open House"
        title.textAlignment = NSTextAlignment.Center
        title.font = UIFont(name: "HelveticaNeue-UltraLight", size: 50)
        title.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
        
        self.view.addSubview(title)
        
        let usernameField = UITextField(frame: CGRectMake(0, 0, 300, 30))
        usernameField.center = CGPointMake(title.center.x, title.center.y + 80)
        usernameField.borderStyle = UITextBorderStyle.RoundedRect
        usernameField.placeholder = "Username"
        usernameField.font = UIFont(name: "HelveticaNeue-UltraLight", size: 14)
        
        self.view.addSubview(usernameField)
        
        let passwordField = UITextField(frame: CGRectMake(0, 0, 300, 30))
        passwordField.center = CGPointMake(usernameField.center.x, usernameField.center.y + 50)
        passwordField.borderStyle = UITextBorderStyle.RoundedRect
        passwordField.placeholder = "Password"
        passwordField.font = UIFont(name: "HelveticaNeue-UltraLight", size: 14)
        
        self.view.addSubview(passwordField)
        
        let signInButton = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        signInButton.frame = CGRectMake(0, 0, 300, 30)
        signInButton.center = CGPointMake(passwordField.center.x, passwordField.center.y + 50)
        signInButton.setTitle("Sign In", forState:UIControlState.Normal)
        signInButton.addTarget(self, action: "signIn:", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(signInButton)
    }

    func signIn(sender:UIButton!){
        println("Sign in pressed")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

