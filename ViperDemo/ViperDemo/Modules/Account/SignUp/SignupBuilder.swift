//
//  SignupBuilder.swift
//  ViperDemo
//
//  Created by Shreya on 18/06/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation

import UIKit

class SignupBuilder {
    
    
    static func build(switchLogin: @escaping () -> Void) -> UIViewController {
        let storyboard = GroceryStoryboard.login.instance
        let view = storyboard.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        
        let router = SignupRouter(viewController: view, switchLogin:switchLogin )
        let authInteractor = AuthInteractor.shared
        let presenter = SignupPresenter(router: router,
                                        useCases: (
                                            signUp: authInteractor.signUp, ()
            )
        )
        presenter.view = view
        view.presenter = presenter
        return view
    }
}

