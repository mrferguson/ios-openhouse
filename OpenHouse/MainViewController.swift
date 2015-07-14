//
//  MainViewController.swift
//  
//
//  Created by Edward Yeh on 7/13/15.
//
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        
        var screenSize = view.bounds
        
        let logOutButton = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        logOutButton.frame = CGRectMake(0, 25, 100, 30)
        logOutButton.setTitle("Log Out", forState:UIControlState.Normal)
        logOutButton.addTarget(self, action: "logOut:", forControlEvents: UIControlEvents.TouchUpInside)
        logOutButton.titleLabel!.font = UIFont(name: "HelveticaNeue-Light", size: 16)
        
        self.view.addSubview(logOutButton)
        
        let title = UILabel(frame: CGRectMake(0, 25, screenSize.width, 30))
        title.text = "Open House"
        title.textAlignment = NSTextAlignment.Center
        title.font = UIFont(name: "HelveticaNeue-Light", size: 16)
        title.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
        
        self.view.addSubview(title)
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: screenSize.width, height: 200)
        
        let collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.frame = CGRectMake(0, 60, screenSize.width, screenSize.height/3)
        collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.backgroundColor = UIColor(red: 220/255, green: 235/255, blue: 1, alpha: 1)
        
        self.view.addSubview(collectionView)
        
        let clientTitle = UILabel(frame: CGRectMake(10, screenSize.height/3 + 60, screenSize.width, 30))
        clientTitle.text = "Clients"
        clientTitle.textAlignment = NSTextAlignment.Left
        clientTitle.font = UIFont(name: "HelveticaNeue-Light", size: 16)
        clientTitle.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        
        self.view.addSubview(clientTitle)
        
        let tableView = UITableView(frame: CGRectMake(0, screenSize.height/3 + 90, screenSize.width, screenSize.height - clientTitle.frame.height))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.backgroundColor = UIColor(red: 220/255, green: 235/255, blue: 1, alpha: 1)
        
        self.view.addSubview(tableView)
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell:UICollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! UICollectionViewCell
        cell.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        cell.layer.borderColor = UIColor.whiteColor().CGColor
        cell.layer.borderWidth = 0.5
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0.0
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        cell.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        cell.textLabel!.text = "Test"
        cell.textLabel!.font = UIFont(name: "HelveticaNeue-Light", size: 16)
        cell.textLabel!.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 30.0
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
