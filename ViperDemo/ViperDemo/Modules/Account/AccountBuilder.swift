//
//  AccountBuilder.swift
//  ViperDemo
//
//  Created by Shreya on 16/06/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation
import UIKit


class AccountBuilder {
    static func build() -> UIViewController {
        
        let storyboard = GroceryStoryboard.login.instance
        let accountview = storyboard.instantiateViewController(withIdentifier: "AccountViewController") as! AccountViewController
        let router = AccountRouter(viewcontroller: accountview,
                                   subModules: (
                                    loginModule : LoginBuilder.build,
                                    signupModule : SignupBuilder.build
            )
        )
        let presenter = AccountPresenter(router: router)
        presenter.view = accountview
        accountview.presenter = presenter
        return accountview
    }
}
