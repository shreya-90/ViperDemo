//
//  WindowRouter.swift
//  ViperDemo
//
//  Created by Shreya on 16/06/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation
import UIKit

protocol WindowRouting {
    func routeTo(kind: WindowRouter.kind) -> Void
}


class WindowRouter {
     private unowned let window: Window
    private var accountView: UIViewController?
    private var tabbarView : UIViewController?
    
    typealias SubModules = (
        accountModule : () -> UIViewController,
        tabbarModule : () -> UIViewController
    )
    
    enum kind {
        case login
        case home
    }
    init(_ window : Window, subModules : SubModules) {
        
        self.window = window
        self.accountView = subModules.accountModule()
        self.tabbarView = subModules.tabbarModule()
    }
}

extension WindowRouter : WindowRouting {
    
    func routeTo(kind : WindowRouter.kind) {
         var viewController: UIViewController?
        switch kind {
            
        case .login:
            viewController = self.accountView
        case .home:
            viewController = self.tabbarView
        }
        
        self.window.rootViewController = viewController
        self.window.makeKeyAndVisible()
    }
}
