//
//  DashboardViewController.swift
//  DashBoardMain
//
//  Created by Mobioapp on 7/18/17.
//  Copyright © 2017 Mobioapp. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource{

    @IBOutlet var blurView: UIView! // for shadow under menu view and enabling/disabling dashboard
    
    @IBOutlet weak var menuBarButtonOutlet: UIBarButtonItem!
    @IBOutlet weak var dashboardCollectionViewOutlet: UICollectionView!
    
    var dashboardScreenSize: CGRect!
    var dashboardScreenWidth: CGFloat!
    var dashboardScreenHeight: CGFloat!
   
    var dashBoardCollectionViewImages = ["Store Locator", "Service Appoinments", "Find your Oil", "Buy Now", "Reminders", "Calculators(EMI & Mileage)", "Mobil Automotive", "Car Maintenance Tips", "Current campaigns", "SOS"]
    
    var dashBoardCollectionViewText = ["LubriCant Store Locator", "Service Appoinments", "Find your Oil", "Buy Now", "Reminders", "Calculators(EMI & Mileage)", "Mobil Automotive Products", "Car Maintenance Tips", "Current campaigns", "SOS/Helpline"]
    
    var identifier = [String]()
    
    var menuView : MenuViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        blurView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        self.view.addSubview(blurView)
        identifier = ["LubriCantStoreLocator","ServiceAppoinments","FindYourOil"]
        
        self.dashboardCollectionViewOutlet.delegate = self
        self.dashboardCollectionViewOutlet.dataSource = self
        
        dashboardScreenSize = UIScreen.main.bounds
        dashboardScreenWidth = dashboardScreenSize.width
        dashboardScreenHeight = dashboardScreenSize.height
        
        //handling borders
        /* If the collection view won't go up then click on the collection view cell and go
         to size inspector , go to view and set y to 0 */
        let dashboardLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        dashboardLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        dashboardLayout.itemSize = CGSize(width: dashboardScreenWidth/2, height: dashboardScreenWidth/2)
        dashboardLayout.minimumInteritemSpacing = 0
        dashboardLayout.minimumLineSpacing = 0
        dashboardCollectionViewOutlet.collectionViewLayout = dashboardLayout
     
        // StoryBoard Id must be set
        menuView = self.storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as!
        MenuViewController
        
        //menuVuew tap gesture and swipe
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToGesture))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToGesture))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        
        self.view.addGestureRecognizer(swipeRight)
        self.view.addGestureRecognizer(swipeLeft)
        
        self.blurView.isHidden = true
     
    
    }
    
    func respondToGesture(gesture: UISwipeGestureRecognizer)
    {
        switch gesture.direction {
        case UISwipeGestureRecognizerDirection.right:
            showMenu()
        case UISwipeGestureRecognizerDirection.left:
            closeMenu()
        default:
            break
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dashBoardCollectionViewImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dashboardCell", for: indexPath) as! DashboardCollectionViewCell
        
        cell.dashboardCollectionViewCellimage.image = UIImage(named: dashBoardCollectionViewImages[indexPath.row])
        cell.dashboardCollectionViewCellLabel.text = self.dashBoardCollectionViewText[indexPath.row]
        cell.layer.borderWidth = 1.0
        //.CGColor
        cell.layer.borderColor = UIColor.gray.cgColor
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("Selected Cell: \(indexPath.row)")
        
        let vcName = identifier[indexPath.row]
        let viewController = storyboard?.instantiateViewController(withIdentifier: vcName)
        self.navigationController?.pushViewController(viewController!, animated: true)
        
    }
    
    
    @IBAction func menuButtonClick(_ sender: Any) {
        
        if(AppDelegate.boolForMenuShow){
          showMenu()
        }else{
         closeMenu()
        }
        
    }
    
    func showMenu()  {
         self.blurView.isHidden = false
        UIView.animate(withDuration: 0.3) { () -> Void in
            self.menuView.view.frame = CGRect(x: 0, y: 60, width: UIScreen.main.bounds.size.width
                , height: UIScreen.main.bounds.size.height)
            self.view.backgroundColor = UIColor.clear
            self.addChildViewController(self.menuView)
            self.view.addSubview(self.menuView.view)
            AppDelegate.boolForMenuShow = false
        }
    }
    func closeMenu(){
         self.blurView.isHidden = true
        UIView.animate(withDuration: 0.3, animations:  {() -> Void in
            self.menuView.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 60, width: UIScreen.main.bounds.size.width
                , height: UIScreen.main.bounds.size.height) }) {( finished) in
                    
        self.menuView.view.removeFromSuperview()
        }
        AppDelegate.boolForMenuShow = true
    }
    
    

}
