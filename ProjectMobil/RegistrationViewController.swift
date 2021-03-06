//
//  RegistrationViewController.swift
//  ProjectMobil
//
//  Created by mobioapp on 7/18/17.
//  Copyright © 2017 MobioApp2. All rights reserved.
//

import UIKit
import Alamofire

class RegistrationViewController: UIViewController, UITextFieldDelegate {
    
    let utils: Utils = Utils()
    
    @IBOutlet weak var usernameTF: UITextField?
    
    @IBOutlet weak var emailTF: UITextField?
    
    @IBOutlet weak var phoneTF: UITextField?
    
    @IBOutlet weak var passwordTF: UITextField?
    
    @IBOutlet weak var confirmPasswordTF: UITextField?
    
    @IBOutlet weak var stackview: UIStackView?
    
    @IBOutlet weak var signInBtn: UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        setUIElementsProperty()
        
        for field in stackview?.subviews as! [UITextField] {
            field.delegate = self
            
            field.layer.borderColor = UIColor.white.cgColor
            field.layer.borderWidth = 1
        }
        
    }
    /*
     // MARK: - Actions below
     */
    
    @IBAction func registerUser(_ sender: Any) {
        
        let username = usernameTF?.text
        let userType = "user"
        let email = emailTF?.text
        let phone = phoneTF?.text
        let password = passwordTF?.text
        let confirmPassword = confirmPasswordTF?.text
        if password != confirmPassword {
            print("Passwords don't match")
        }
        
        let parameters: Parameters = [
            "username": username,
            "email": email,
            "customer_contact": phone,
            "password": password,
            "user_type": userType
        ]
        
        Alamofire.request("http://192.168.1.222/mobil_app/user_add_api.php", method: .post, parameters: parameters).responseJSON{
            response in
            print(response)
        }
        
        
        
        
        
        
    }
    

    /*
    // MARK: - Delegates below
    */
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func setUIElementsProperty() {
    
        let colorWhite : UIColor = UIColor.white
        signInBtn?.layer.borderWidth = 1
        signInBtn?.layer.borderColor = colorWhite.cgColor
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        utils.moveTextField(view: self.view, textfield: textField, moveDistance: 250, up: true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        utils.moveTextField(view: self.view, textfield: textField, moveDistance: 250, up: false)
    }

}
