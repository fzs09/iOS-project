//
//  MenuViewController.swift
//  DashBoardMain
//
//  Created by Mobioapp on 7/18/17.
//  Copyright © 2017 Mobioapp. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    //
    @IBOutlet weak var menuTableView: UITableView!
    let menuItemArray = ["Home","My Workshop","Enlist Your Workshop","My appiontments","login/logout"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItemArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell
        
        cell.menuLabelTitle.text = menuItemArray[indexPath.row]
        
        return cell
    }
}
