//
//  LoginViewController.swift
//  GreenGrocery
//
//  Created by Viswanathan Venkitachelam on 21/06/19.
//  Copyright © 2019 LetsCodeEasy. All rights reserved.
//

import UIKit

protocol LoginView: class {
    func updateInvalid()
    func updateProgress(isCompleted:Bool)
}



class LoginViewController: UIViewController {
    @IBOutlet weak var emailAccountControl: AccountTextControl!
    @IBOutlet weak var passwordAccountControl: AccountTextControl!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var statusLabel: UILabel!
    
    var presenter: LoginPresentation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        emailAccountControl.configure(title: "Email", validationRules: [RequiredRule(),EmailRule()])
        passwordAccountControl.configure(title: "Password", validationRules: [RequiredRule(),PasswordRule()])
       
    }
    
    @IBAction func onLogin(_ sender: Any) {
        self.presenter?.validate(usingFields: [emailAccountControl,passwordAccountControl], completion:
            {(isValid) in
                if isValid {
                    //We will proceed wth login API call
                }
        })
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        // Show signup screen when sign up option is chosen
            self.presenter?.onShowSignUp()
    }
}

extension LoginViewController: LoginView {
    
    func updateInvalid() {
        emailAccountControl.setErrorMessage()
        passwordAccountControl.setErrorMessage()
    }
    
    func updateProgress(isCompleted: Bool) {
        loginButton.isEnabled = isCompleted
        loginButton.setTitle(isCompleted ? "Login" : "Logging in...", for: .normal)
        
        if isCompleted {
            emailAccountControl.inputTextField.text = ""
            passwordAccountControl.inputTextField.text = "" 
        }
    }
    
}
