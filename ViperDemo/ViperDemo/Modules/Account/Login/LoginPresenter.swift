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
}


class LoginPresenter {
    private var router : LoginRouting
    
    weak var view : LoginView?
    
    init(router : LoginRouting) {
        self.router = router
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
        
        if isValid {
            
        }
    }
    
    
    func onShowSignUp() {
        self.router.routeToSignUp()   //used to make a call to its parent
    }
}
