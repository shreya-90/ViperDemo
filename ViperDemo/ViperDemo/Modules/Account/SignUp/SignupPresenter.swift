//
//  SignupPresenter.swift
//  ViperDemo
//
//  Created by Shreya on 18/06/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation
import UIKit


protocol SignupPresentation {
    func onShowLogin() ->Void
    func validate(usingFields fields: [FieldValidatable], completion: (Bool) -> ())
    func signUp(username:String,email:String,password:String) -> Void
}

class SignupPresenter {
    weak var view : SignUpView?
    private let router : SignupRouting
    
    typealias UseCases = (
        signUp: (_ username: String,
        _ email: String,
        _ password : String ,
        _ completion: @escaping (AuthResult<String>) -> Void) -> Void, ()
    )
    
    private let useCases : UseCases
    
    init(router : SignupRouting, useCases: UseCases) {
        self.router = router
        self.useCases = useCases 
    }
    
    
}

extension SignupPresenter : SignupPresentation {
   
    
    func onShowLogin() {
         self.router.routeToLogin()
    }
    
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
        
        if isValid {
            self.view?.updateProgress(isCompleted: false) // to update Signup button title
        }
        completion(isValid)
    }
    
    func signUp(username: String, email: String, password: String) {
        self.useCases.signUp(username,email,password) { result in
            
            switch(result){
                
            case .success(let message):
                self.view?.updateStatus(usingViewModel: AuthStatusViewModel(title:message,color: ColourConstant.success))
                DispatchQueue.main.asyncAfter(deadline:.now() + 2){ [weak self] in
                    self?.router.routeToLogin()
                }
                
                break
            case .failure(let result):
                self.view?.updateStatus(usingViewModel: AuthStatusViewModel(title:result,color: ColourConstant.failure))
                break
            }
            self.view?.updateProgress(isCompleted: true)
        }
    }
}
