//
//  MainViewController.swift
//  
//
//  Created by Edward Yeh on 7/13/15.
//
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        
        let logOutButton = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        logOutButton.frame = CGRectMake(0, 30, 100, 30)
        logOutButton.setTitle("Log Out", forState:UIControlState.Normal)
        logOutButton.addTarget(self, action: "logOut:", forControlEvents: UIControlEvents.TouchUpInside)
        logOutButton.titleLabel!.font = UIFont(name: "HelveticaNeue-Light", size: 16)
        
        self.view.addSubview(logOutButton)
        
    }

    func logOut(sender:AnyObject) {
        
        let signInView:ViewController = ViewController()
        signInView.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        self.presentViewController(signInView, animated: true, completion: nil)
        
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
