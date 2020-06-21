//
//  LoginRouter.swift
//  ViperDemo
//
//  Created by Shreya on 18/06/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation
import UIKit

protocol LoginRouting {
    func routeToSignUp()
}

class LoginRouter {
    private weak var view : UIViewController?
    private let  switchSignUp : () -> Void  // declare a closure type property
    
    
    init(view : UIViewController,switchSignUp: @escaping () -> Void) {
        self.view = view
        self.switchSignUp = switchSignUp
    }
}

extension LoginRouter : LoginRouting {
    
    func routeToSignUp() {
        self.switchSignUp()
    }
}
