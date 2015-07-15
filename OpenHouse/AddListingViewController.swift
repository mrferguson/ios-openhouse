//
//  AddListingViewController.swift
//  
//
//  Created by Edward Yeh on 7/14/15.
//
//

import UIKit

class AddListingViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        var screenSize = view.bounds
        
        self.view.backgroundColor = UIColor(red: 220/255, green: 235/255, blue: 1, alpha: 1)
        
        // CANCEL BUTTON
        
        let cancelButton = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        cancelButton.frame = CGRectMake(0, 25, 100, 30)
        cancelButton.setTitle("Cancel", forState:UIControlState.Normal)
        cancelButton.addTarget(self, action: "cancel:", forControlEvents: UIControlEvents.TouchUpInside)
        cancelButton.titleLabel!.font = UIFont(name: "HelveticaNeue-Light", size: 16)
        
        self.view.addSubview(cancelButton)
        
        // TITLE
        
        let title = UILabel(frame: CGRectMake(0, screenSize.height * 0.2, screenSize.width, 50))
        title.text = "Add a Listing"
        title.textAlignment = NSTextAlignment.Center
        title.font = UIFont(name: "HelveticaNeue-UltraLight", size: 40)
        title.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
        
        self.view.addSubview(title)
        
        // ADDRESS FIELD
        
        let addressField = UITextField(frame: CGRectMake(0, 0, 300, 30))
        addressField.center = CGPointMake(title.center.x, title.center.y + 80)
        addressField.borderStyle = UITextBorderStyle.RoundedRect
        addressField.placeholder = "Address"
        addressField.font = UIFont(name: "HelveticaNeue", size: 16)
        addressField.delegate = self
        
        self.view.addSubview(addressField)
        
        // IMAGE
        
        // ADD BUTTON
        
        let addButton = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        addButton.frame = CGRectMake(0, 0, 100, 30)
        addButton.center = CGPointMake(title.center.x, screenSize.height - 50)
        addButton.setTitle("Add Listing", forState:UIControlState.Normal)
        addButton.addTarget(self, action: "addListing:", forControlEvents: UIControlEvents.TouchUpInside)
        addButton.titleLabel!.font = UIFont(name: "HelveticaNeue-Light", size: 16)
        
        self.view.addSubview(addButton)
        
    }
    
    // CANCEL BUTTON FUNCTION
    
    func cancel(sender:AnyObject) {
        
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
