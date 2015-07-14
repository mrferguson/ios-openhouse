//
//  ViewController.swift
//  OpenHouse
//
//  Created by Edward Yeh on 7/13/15.
//  Copyright (c) 2015 Edward Yeh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        
        self.view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        
        var screenSize = view.bounds
        
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
        usernameField.font = UIFont(name: "HelveticaNeue-UltraLight", size: 16)
        usernameField.delegate = self
        
        self.view.addSubview(usernameField)
        
        let passwordField = UITextField(frame: CGRectMake(0, 0, 300, 30))
        passwordField.center = CGPointMake(usernameField.center.x, usernameField.center.y + 50)
        passwordField.borderStyle = UITextBorderStyle.RoundedRect
        passwordField.placeholder = "Password"
        passwordField.font = UIFont(name: "HelveticaNeue-UltraLight", size: 16)
        passwordField.delegate = self
        
        self.view.addSubview(passwordField)
        
        let signInButton = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        signInButton.frame = CGRectMake(0, 0, 100, 30)
        signInButton.center = CGPointMake(passwordField.center.x, passwordField.center.y + 50)
        signInButton.setTitle("Sign In", forState:UIControlState.Normal)
        signInButton.addTarget(self, action: "signIn:", forControlEvents: UIControlEvents.TouchUpInside)
        signInButton.titleLabel!.font = UIFont(name: "HelveticaNeue-Light", size: 16)
        
        self.view.addSubview(signInButton)
        
        let registerText = UILabel(frame: CGRectMake(title.center.x - 50, screenSize.height * 0.8, 100, 50))
        registerText.text = "Not registered?"
        registerText.textAlignment = NSTextAlignment.Center
        registerText.font = UIFont(name: "HelveticaNeue-UltraLight", size: 16)
        registerText.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
        
        self.view.addSubview(registerText)
        
        let signUpButton = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        signUpButton.frame = CGRectMake(0, 0, 100, 30)
        signUpButton.center = CGPointMake(title.center.x, registerText.center.y + 30)
        signUpButton.setTitle("Sign Up", forState:UIControlState.Normal)
        signUpButton.addTarget(self, action: "signUp:", forControlEvents: UIControlEvents.TouchUpInside)
        signUpButton.titleLabel!.font = UIFont(name: "HelveticaNeue-Light", size: 16)
        
        self.view.addSubview(signUpButton)
        
        var tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        view.addGestureRecognizer(tap)
    }

    func signIn(sender:AnyObject) {
        
        let mainView:MainViewController = MainViewController()
        mainView.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        self.presentViewController(mainView, animated: true, completion: nil)
        
    }
    
    func signUp(sender:AnyObject) {
        
        let signUpView:SignUpViewController = SignUpViewController()
        signUpView.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        self.presentViewController(signUpView, animated: true, completion: nil)
        
    }
    
    func DismissKeyboard() {
        
        view.endEditing(true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

