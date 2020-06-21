//
//  AccountRouter.swift
//  ViperDemo
//
//  Created by Shreya on 16/06/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation
import UIKit

protocol AccountRouting {
    func showLogin() ->Void
    func showSignup() ->Void
}

class AccountRouter {
     let viewcontroller : UIViewController
    
    
    typealias SubModules = (
        loginModule : (_ switchSignUp : @escaping () -> Void) -> UIViewController,
        signupModule : (_ switchLogin : @escaping () -> Void ) -> UIViewController
    )
    
    private var subModules : SubModules
    
    private lazy var loginView = self.subModules.loginModule { [weak self] in
        //This is where i will get callback to switch to signup view
        self?.showSignup()
    }
    
    private lazy var signupView = self.subModules.signupModule(){ [weak self] in
        //This is where i will get callback to switch to login  view
        self?.showLogin()
        
    }
    init(viewcontroller : UIViewController, subModules : SubModules){
        self.viewcontroller = viewcontroller
        self.subModules = subModules
    }
}


extension AccountRouter : AccountRouting {
    func showLogin() {
        remove(asChildViewController: signupView)
        add(asChildViewController:loginView , direction: .transitionFlipFromLeft)
    }
    
    func showSignup() {
        remove(asChildViewController: loginView)
        add(asChildViewController:signupView , direction: .transitionFlipFromRight)
    }
}


private extension AccountRouter {
    
    func add(asChildViewController childController: UIViewController, direction: UIView.AnimationOptions) -> Void {
        viewcontroller.addChild(childController)
        UIView.transition(with: viewcontroller.view, duration: 0.3, options: direction, animations: { [viewcontroller] in
            viewcontroller.view.addSubview(childController.view)
            }, completion: nil)
        childController.view.frame = viewcontroller.view.bounds
        childController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        childController.didMove(toParent: viewcontroller)
    }
    
    func remove(asChildViewController childController: UIViewController) -> Void {
        childController.willMove(toParent: nil)
        childController.view.removeFromSuperview()
        childController.removeFromParent()
    }
}
