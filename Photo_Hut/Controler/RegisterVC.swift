//
//  RegisterVC.swift
//  Photo_Hut
//
//  Created by Md. Saiful Islam on 3/3/20.
//  Copyright © 2020 Md. Saiful Islam. All rights reserved.
//

import UIKit
import Firebase

class RegisterVC: UIViewController {
    
    @IBOutlet weak var usernameTxt: UITextField!
    
    @IBOutlet weak var emailTxt: UITextField!
    
    @IBOutlet weak var passwordTxt: UITextField!
    
    @IBOutlet weak var confirmPassTxt: UITextField!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var passCheckImg: UIImageView!
    
    @IBOutlet weak var confirmPassCheckImg: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //confirmPassTxt.delegate = self
        
        passwordTxt.addTarget(self, action: #selector(textFieldDidChange(_textField:)), for: UIControl.Event.editingChanged)
        confirmPassTxt.addTarget(self, action: #selector(textFieldDidChange(_textField:)), for: UIControl.Event.editingChanged)

        // Do any additional setup after loading the view.
    }
    
    @objc func textFieldDidChange(_textField : UITextField){
        guard let passTxt = passwordTxt.text else {return}
        
        if _textField == confirmPassTxt {
            passCheckImg.isHidden = false
            confirmPassCheckImg.isHidden = false
        } else{
            
            if passTxt.isEmpty {
                passCheckImg.isHidden = true
                confirmPassCheckImg.isHidden = true
                confirmPassTxt.text = ""
            }
        }
        
        if passwordTxt.text == confirmPassTxt.text{
            passCheckImg.image = UIImage (named: AppImages.GreenCheck)
            confirmPassCheckImg.image = UIImage (named: AppImages.GreenCheck)
        } else{
            passCheckImg.image = UIImage (named: AppImages.RedCheck)
            confirmPassCheckImg.image = UIImage (named: AppImages.RedCheck)
        }
        
    }
    
    @IBAction func registerClicked(_ sender: Any) {
        guard let email = emailTxt.text , !email.isNotEmpty ,
            let username = usernameTxt.text , !username.isNotEmpty ,
            let password = passwordTxt.text , !password.isNotEmpty else {return}
    activityIndicator.startAnimating()
        
    Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
          
        if let error = error{
            debugPrint(error)
            return
        }
            self.activityIndicator.stopAnimating()
            print("Successfully register new user.")
        }
        
    }
    

}
