//
//  LoginPresenter.swift
//  ViperDemo
//
//  Created by Shreya on 18/06/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation
import UIKit


protocol LoginPresentation {
    func onShowSignUp() -> ()
    func validate(usingFields fields : [FieldValidatable],completion: (Bool)->())
    func login(email:String, password : String)
}


class LoginPresenter {
    private var router : LoginRouting
    
    weak var view : LoginView?
    
    typealias UseCases = (
        login :  (_ email: String, _ password : String , _ completion: @escaping (AuthResult<String>) -> Void) -> Void,()
    )
    private let useCases : UseCases
    
    init(router : LoginRouting,useCases : UseCases) {
        self.router = router
        self.useCases = useCases
    }
}

extension LoginPresenter : LoginPresentation {
    func validate(usingFields fields: [FieldValidatable], completion: (Bool) -> ()) {
        
        var isValid = true
        fields.forEach { (field) in
            field.validationRules.forEach({ (rule) in
                if !rule.validate(value: field.validationText) {
                    isValid = false
                    return
                }
            })
        }
       self.view?.updateInvalid()
        self.view?.updateProgress(isCompleted: false)
        completion(isValid)
        
    }
    
    
    func onShowSignUp() {
        self.router.routeToSignUp()   //used to make a call to its parent
    }
    
    func login(email: String, password: String) {
        
        DispatchQueue.global(qos: .background).async { [weak self] in
            
            guard let `self` = self else {
                return
            }
            self.useCases.login(email,password) {   result in
                switch (result) {
                    
                case .success(let token) :
                    DispatchQueue.main.async {
                        print("Token received: \(token)")
                    }
                    break
                case .failure(let error) :
                    DispatchQueue.main.async {
                        print("Login Error  received: \(error)")
                    }
                    break
                }
                
            }
            
            DispatchQueue.main.async {
                self.view?.updateProgress(isCompleted: true)
            }
        }
    }
}
