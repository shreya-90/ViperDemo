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
}

class SignupPresenter {
    weak var view : SignUpView?
    private let router : SignupRouting
    
    init(router : SignupRouting) {
        self.router = router
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
            
        }
    }
}
