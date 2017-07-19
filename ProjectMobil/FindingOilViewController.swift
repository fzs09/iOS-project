//
//  FindingOilViewController.swift
//  DashBoardMain
//
//  Created by Mobioapp on 7/18/17.
//  Copyright © 2017 Mobioapp. All rights reserved.
//

import UIKit

class FindingOilViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var loadingIndication: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAddress()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func loadAddress(){
        let requestUrl = NSURL(string: "https://www.google.com/")
        let request = NSURLRequest(url: requestUrl! as URL)
        webView.loadRequest(request as URLRequest)
        
    }
    func webViewDidStartLoad(_ : UIWebView){
        loadingIndication.startAnimating()
        NSLog("Loading")
        
    }
    
    
    func webViewDidFinishLoad(_ : UIWebView){
        loadingIndication.stopAnimating()
        NSLog("Done Loading")
        loadingIndication.isHidden = true
    }
    

}
