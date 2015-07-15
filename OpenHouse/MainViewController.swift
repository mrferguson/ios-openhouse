//
//  MainViewController.swift
//  
//
//  Created by Edward Yeh on 7/13/15.
//
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        
        var screenSize = view.bounds
        
        // LOG OUT BUTTON
        
        let logOutButton = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        logOutButton.frame = CGRectMake(0, 25, 100, 30)
        logOutButton.setTitle("Log Out", forState:UIControlState.Normal)
        logOutButton.addTarget(self, action: "logOut:", forControlEvents: UIControlEvents.TouchUpInside)
        logOutButton.titleLabel!.font = UIFont(name: "HelveticaNeue-Light", size: 15)
        
        self.view.addSubview(logOutButton)
        
        // TITLE
        
        let title = UILabel(frame: CGRectMake(0, 25, screenSize.width, 30))
        title.text = "Open House Dashboard"
        title.textAlignment = NSTextAlignment.Center
        title.font = UIFont(name: "HelveticaNeue-Bold", size: 15)
        title.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
        
        self.view.addSubview(title)

/* COLLECTION VIEW
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
*/
        // LISTING SCROLL VIEW
        
        var listingAddress = ["1047 Loma Lisa Ln", "1315 Saint Albans Rd", "1066 Longview Dr", "87 Mission Ridge Ct"]
        var listingCity = ["Arcadia, CA 91006", "San Marino, CA 91108", "Diamond Bar, CA 91765", "Fremont, CA 94539"]
        var scrollViewPage = [UIView]()
        var backgroundImageView = [UIImageView]()
        var addressLabel = [UILabel]()
        var cityLabel = [UILabel]()
        
        let scrollView = UIScrollView(frame: CGRectMake(0, 60, screenSize.width, screenSize.height/3))
        scrollView.pagingEnabled = true
        
        for (index, name) in enumerate(listingAddress) {
            
            scrollViewPage.append(UIView())
            scrollViewPage[index].frame = CGRect(x: scrollView.frame.width * CGFloat(index), y: 0, width: scrollView.frame.width, height: scrollView.frame.height)
            
            backgroundImageView.append(UIImageView())
            backgroundImageView[index].image = UIImage(named: "house\(index).jpg")
            backgroundImageView[index].frame = CGRectMake(0, 0, scrollViewPage[index].frame.width, scrollViewPage[index].frame.height)
            scrollViewPage[index].addSubview(backgroundImageView[index])
                    
            addressLabel.append(UILabel())
            addressLabel[index].frame = CGRectMake(0, scrollViewPage[index].frame.height - 40, scrollViewPage[index].frame.width, 20)
            addressLabel[index].text = "\(name)"
            addressLabel[index].textAlignment = NSTextAlignment.Center
            addressLabel[index].font = UIFont(name: "HelveticaNeue-Light", size: 16)
            addressLabel[index].backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
            addressLabel[index].textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1.0)
            scrollViewPage[index].addSubview(addressLabel[index])
            
            cityLabel.append(UILabel())
            cityLabel[index].frame = CGRectMake(0, scrollViewPage[index].frame.height - 20, scrollViewPage[index].frame.width, 20)
            cityLabel[index].text = listingCity[index]
            cityLabel[index].textAlignment = NSTextAlignment.Center
            cityLabel[index].font = UIFont(name: "HelveticaNeue-Bold", size: 12)
            cityLabel[index].backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
            cityLabel[index].textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1.0)
            scrollViewPage[index].addSubview(cityLabel[index])
            
            scrollView.addSubview(scrollViewPage[index])
            
            }
        
        scrollView.contentSize = CGSizeMake(scrollView.frame.width * CGFloat(listingAddress.count), scrollView.frame.height)
        
        self.view.addSubview(scrollView)
        
        // ADD LISTING BUTTON
        
        let addListingButton = UIButton.buttonWithType(UIButtonType.ContactAdd) as! UIButton
        addListingButton.center = CGPointMake(screenSize.width - 20, title.center.y + 40)
        addListingButton.tintColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        addListingButton.addTarget(self, action: "addListing:", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(addListingButton)
        
        // CLIENT TABLE TITLE
        
        let clientTitle = UILabel(frame: CGRectMake(0, screenSize.height/3 + 60, screenSize.width, 40))
        clientTitle.text = "Clients"
        clientTitle.textAlignment = NSTextAlignment.Center
        clientTitle.backgroundColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
        clientTitle.font = UIFont(name: "HelveticaNeue-Bold", size: 15)
        clientTitle.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        
        self.view.addSubview(clientTitle)
        
        // ADD CLIENT BUTTON
        
        let addClientButton = UIButton.buttonWithType(UIButtonType.ContactAdd) as! UIButton
        addClientButton.center = CGPointMake(screenSize.width - 20, clientTitle.center.y)
        addClientButton.tintColor = UIColor(red: 0, green: 0, blue: 1, alpha: 1)
        addClientButton.addTarget(self, action: "addClient:", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(addClientButton)
        
        // CLIENT TABLE VIEW
        
        let tableView = UITableView(frame: CGRectMake(0, screenSize.height/3 + 100, screenSize.width, screenSize.height - clientTitle.frame.height))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.backgroundColor = UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        
        self.view.addSubview(tableView)
        
    }

    /* COLLECTION VIEW
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
    */
    
    // CLIENT TABLE VIEW DATASOURCE
    
    var clientList = ["Edward Yeh", "Tina Yeh", "Mochi Yeh", "Grace Yeh", "George Yeh", "Joseph Yeh", "Roger Yeh", "Edward Yeh", "Tina Yeh", "Mochi Yeh", "Grace Yeh", "George Yeh", "Joseph Yeh", "Roger Yeh"]
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clientList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel!.text = clientList[indexPath.row]
        cell.textLabel!.font = UIFont(name: "HelveticaNeue-Light", size: 16)
        cell.textLabel!.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 30.0
    }
    
    // LOG OUT BUTTON FUNCTION
    
    func logOut(sender:AnyObject) {
        
        let signInView:ViewController = ViewController()
        signInView.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        self.presentViewController(signInView, animated: true, completion: nil)
        
    }
    
    // ADD LISTING BUTTON FUNCTION
    
    func addListing(sender:AnyObject) {
        
        let addListingView:AddListingViewController = AddListingViewController()
        addListingView.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        self.presentViewController(addListingView, animated: true, completion: nil)
        
    }
    
    // ADD CLIENT BUTTON FUNCTION
    
    func addClient(sender:AnyObject) {
        
        let addClientView:AddClientViewController = AddClientViewController()
        addClientView.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        self.presentViewController(addClientView, animated: true, completion: nil)
        
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
