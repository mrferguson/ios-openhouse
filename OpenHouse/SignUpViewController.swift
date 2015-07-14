//
//  SignUpViewController.swift
//  
//
//  Created by Edward Yeh on 7/13/15.
//
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 204/255, green: 229/255, blue: 1, alpha: 1)
        
        var screenSize = UIScreen.mainScreen().bounds
        
        let title = UILabel(frame: CGRectMake(0, screenSize.height * 0.3, screenSize.width, 50))
        title.text = "Create an account"
        title.textAlignment = NSTextAlignment.Center
        title.font = UIFont(name: "HelveticaNeue-UltraLight", size: 40)
        title.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
        
        self.view.addSubview(title)
        
        let nameField = UITextField(frame: CGRectMake(0, 0, 300, 30))
        nameField.center = CGPointMake(title.center.x, title.center.y + 80)
        nameField.borderStyle = UITextBorderStyle.RoundedRect
        nameField.placeholder = "Username"
        nameField.font = UIFont(name: "HelveticaNeue", size: 16)
        nameField.delegate = self
        
        self.view.addSubview(nameField)
        
        let passField = UITextField(frame: CGRectMake(0, 0, 300, 30))
        passField.center = CGPointMake(title.center.x, nameField.center.y + 50)
        passField.borderStyle = UITextBorderStyle.RoundedRect
        passField.placeholder = "Password"
        passField.font = UIFont(name: "HelveticaNeue", size: 16)
        passField.delegate = self
        
        self.view.addSubview(passField)
        
        let verPassField = UITextField(frame: CGRectMake(0, 0, 300, 30))
        verPassField.center = CGPointMake(title.center.x, passField.center.y + 50)
        verPassField.borderStyle = UITextBorderStyle.RoundedRect
        verPassField.placeholder = "Verify Password"
        verPassField.font = UIFont(name: "HelveticaNeue", size: 16)
        verPassField.delegate = self
        
        self.view.addSubview(verPassField)
        
        let emailField = UITextField(frame: CGRectMake(0, 0, 300, 30))
        emailField.center = CGPointMake(title.center.x, verPassField.center.y + 50)
        emailField.borderStyle = UITextBorderStyle.RoundedRect
        emailField.placeholder = "Email"
        emailField.font = UIFont(name: "HelveticaNeue", size: 16)
        emailField.delegate = self
        
        self.view.addSubview(emailField)
        
        let signUpButton = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        signUpButton.frame = CGRectMake(0, 0, 100, 30)
        signUpButton.center = CGPointMake(title.center.x, emailField.center.y + 50)
        signUpButton.setTitle("Sign Up", forState:UIControlState.Normal)
        signUpButton.addTarget(self, action: "signUp:", forControlEvents: UIControlEvents.TouchUpInside)
        signUpButton.titleLabel!.font = UIFont(name: "HelveticaNeue-Light", size: 16)
        
        self.view.addSubview(signUpButton)
        
        let signInButton = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        signInButton.frame = CGRectMake(0, 30, 100, 30)
        signInButton.setTitle("Sign In", forState:UIControlState.Normal)
        signInButton.addTarget(self, action: "signIn:", forControlEvents: UIControlEvents.TouchUpInside)
        signInButton.titleLabel!.font = UIFont(name: "HelveticaNeue-Light", size: 16)
        
        self.view.addSubview(signInButton)
        
        var tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        view.addGestureRecognizer(tap)
        
    }
    
    func signIn(sender:AnyObject) {
        
        let signInView:ViewController = ViewController()
        signInView.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        self.presentViewController(signInView, animated: true, completion: nil)
        
    }
    
    func signUp(sender:AnyObject) {
        
        let mainView:MainViewController = MainViewController()
        mainView.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        self.presentViewController(mainView, animated: true, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
