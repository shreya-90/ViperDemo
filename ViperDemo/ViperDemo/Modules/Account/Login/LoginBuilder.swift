//
//  LoginBuilder.swift
//  ViperDemo
//
//  Created by Shreya on 18/06/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation
import UIKit


class LoginBuilder {
    
    static func build(switchSignUp : @escaping () -> Void) -> UIViewController {
        let storyboard = GroceryStoryboard.login.instance
        let view = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        let router = LoginRouter(view: view, switchSignUp: switchSignUp)
        let authInteractor = AuthInteractor.shared
        let presenter = LoginPresenter(router: router, useCases: (
            login : authInteractor.login, ()
        ))
        presenter.view = view
        view.presenter = presenter
        
        return view
    }
    
}
