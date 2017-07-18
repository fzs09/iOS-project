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
        
        signInBtn?.layer.borderWidth = 1
        signInBtn?.layer.borderColor = UIColor.white.cgColor
        
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

}
