//
//  SignupRouter.swift
//  ViperDemo
//
//  Created by Shreya on 18/06/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation
import UIKit


protocol SignupRouting {
    func routeToLogin()
}

class SignupRouter {
    private var viewController : UIViewController
    private let  switchLogin : () -> Void  // declare a closure type property
    
    init(viewController : UIViewController,switchLogin: @escaping () -> Void) {
        self.viewController = viewController
        self.switchLogin = switchLogin
    }
}

extension SignupRouter : SignupRouting {
    func routeToLogin() {
        self.switchLogin()
    }
}
