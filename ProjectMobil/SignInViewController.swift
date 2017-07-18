//
//  ViewController.swift
//  ProjectMobil
//
//  Created by MobioApp2 on 7/17/17.
//  Copyright © 2017 MobioApp2. All rights reserved.
//

import UIKit
import Alamofire
class SignInViewController: UIViewController {

    
    @IBOutlet weak var userNameOutlet: UITextField!
    @IBOutlet weak var forgetPassWindow: UIView!
    @IBOutlet weak var passwordOutlet: UITextField!
    
    @IBOutlet weak var signUpOutlet: UIButton!
    @IBOutlet weak var forgetPassOutlet: UIButton!
    @IBOutlet weak var backgroundOutlet: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUIElementProperties()
        

        self.forgetPassWindow.isHidden = true
        
        
                
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if ((forgetPassWindow) != nil) {
        
            forgetPassWindow.isHidden = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func forgetPassAction(_ sender: Any) {
        forgetPassWindow.isHidden = false
    }
    
    func setUIElementProperties(){
    
        let colorWhite : UIColor = UIColor.white
        forgetPassOutlet.layer.borderWidth = 1
        
        forgetPassOutlet.layer.borderColor = colorWhite.cgColor
        signUpOutlet.layer.borderWidth = 1
        signUpOutlet.layer.borderColor = colorWhite.cgColor
    }
    
    @IBAction func signInAction(_ sender: Any) {
        
        let user = userNameOutlet.text
        let pass = passwordOutlet.text
        let parameters: Parameters = [
            "username": user!,
            "password": pass!
        ]
        Alamofire.request("http://192.168.1.222/mobil_app/user_login_api.php", method: .post, parameters: parameters).responseJSON { response in
            print(response)
        }
        
    }

    @IBAction func signUpAction(_ sender: Any) {
        
    }

}

