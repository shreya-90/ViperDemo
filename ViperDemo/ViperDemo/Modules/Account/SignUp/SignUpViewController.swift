//
//  SignUpViewController.swift
//  GreenGrocery
//
//  Created by Viswanathan Venkitachelam on 22/06/19.
//  Copyright © 2019 LetsCodeEasy. All rights reserved.
//

import UIKit

struct AuthStatusViewModel {
    let title: String
    let color: String
}

protocol SignUpView: class {
//    func updateInvalid()
//    func updateProgress(message: String, isCompleted: Bool)
//    func updateStatus(usingViewModel viewModel: AuthStatusViewModel)
    func updateInvalid()
    func updateProgress(isCompleted:Bool)
}

protocol SignUpPresentation {
    func onShowLogin()
    func validate(usingFields fields :[FieldValidatable], completion: (Bool)->())
    func signUp(username: String, email: String, password: String)
}

class SignUpViewController: UIViewController {

    var presenter: SignupPresentation?
    
    @IBOutlet weak var nameControl: AccountTextControl!
    @IBOutlet weak var emailControl: AccountTextControl!
    @IBOutlet weak var passwordControl: AccountTextControl!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nameControl.configure(title: "Name", validationRules: [RequiredRule()])
        emailControl.configure(title: "Email", validationRules: [RequiredRule(), EmailRule()])
        passwordControl.configure(title: "Password", validationRules: [RequiredRule(), PasswordRule()])
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        let fields: [FieldValidatable] = [nameControl, emailControl, passwordControl]
        presenter?.validate(usingFields: fields) { isValid in
            if isValid {
                // presenter?.signUp(username: nameControl.inputTextField.text!,
//                                  email: emailControl.inputTextField.text!,
//                                  password: passwordControl.inputTextField.text!)
            }
        }
    }
    
    @IBAction func onLogin(_ sender: Any) {
        // Show the login screen
        self.presenter?.onShowLogin()
    }
}

extension SignUpViewController: SignUpView {
    func updateProgress(isCompleted: Bool) {
        
    }
    

    func updateInvalid() {
        nameControl.setErrorMessage()
        emailControl.setErrorMessage()
        passwordControl.setErrorMessage()
    }
    

//
//    func updateStatus(usingViewModel viewModel: AuthStatusViewModel) {
//        statusLabel.text = viewModel.title
//        statusLabel.textColor = UIColor(hex: viewModel.color)
//    }
}
