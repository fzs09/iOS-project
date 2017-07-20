
//
//  ViewController.swift
//  ProjectMobil
//
//  Created by MobioApp2 on 7/17/17.
//  Copyright © 2017 MobioApp2. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class SignInViewController: UIViewController, UITextFieldDelegate {

    let utils: Utils = Utils()
    
    
//    var dashboardViewController : DashboardViewController!
    
    @IBOutlet weak var userNameOutlet: UITextField!
    @IBOutlet weak var forgetPassWindow: UIView!
    @IBOutlet weak var passwordOutlet: UITextField!
    
    
    @IBOutlet weak var usernameForForgetPass: UITextField!
    @IBOutlet weak var signUpOutlet: UIButton!
    @IBOutlet weak var forgetPassOutlet: UIButton!
    @IBOutlet weak var backgroundOutlet: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUIElementProperties()
        self.forgetPassWindow.isHidden = true
        
        userNameOutlet.delegate = self
        passwordOutlet.delegate = self
        usernameForForgetPass.delegate = self
        
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if ((forgetPassWindow) != nil) {
        
            forgetPassWindow.isHidden = true
        }
    }
    
    func moveTextField(textfield: UITextField, moveDistance: Int, up: Bool) {
        let duration = 0.3
        let distance: CGFloat = CGFloat(up ? -moveDistance: moveDistance)
        
        UIView.beginAnimations("animateTextField", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(duration)
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: distance)
        UIView.commitAnimations()
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
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                if json["success"] == "true" {
                    // perform segue here.
                    print(json)
                    self.performSegue(withIdentifier: "login", sender: nil)
                
                    
                }

            case .failure(let error):
                print(error)
                
            }
        }
        
    }

    @IBAction func signUpAction(_ sender: Any) {
        
    }
    
    @IBAction func sendPasswordAction(_ sender: Any) {
        
        let user = usernameForForgetPass.text
        let parameters: Parameters = [
            "username": user!,
        ]
        Alamofire.request("http://192.168.1.222/mobil_app/user_forget_pass_api.php", method: .post, parameters: parameters).responseJSON { response in
            
            print(response)
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print(json)
                
            case .failure(let error):
                print(error)
                
            }
        }
    }
    
    /**
      Delegates below
     */
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        utils.moveTextField(view: self.view, textfield: textField, moveDistance: 250, up: true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        utils.moveTextField(view: self.view, textfield: textField, moveDistance: 250, up: false)
    }

}

