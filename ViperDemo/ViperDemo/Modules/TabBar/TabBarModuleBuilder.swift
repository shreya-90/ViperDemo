//
//  TabBarModuleBuilder.swift
//  ViperDemo
//
//  Created by Shreya on 04/06/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation
import  UIKit

class TabBarModuleBuilder {
    
    
    static  func build(usingSubModules submodules : TabBarRouter.SubModules) -> UITabBarController {
    
        let tabs = TabBarRouter.tabs(usingSubmodules: submodules)
        let interactor  = CartInteractor(database: RealmDatabase.shared)
        let presenter = TabBarPresenter(useCase: (
            getCartCount : interactor.getCartCount, ()
        ))
        let tabBarController = GroceryTabBarController(tabs: tabs, presenter: presenter) //programatically building tabbar
        presenter.view = tabBarController
//      tabBarController.tabBar.tintColor = UIColor.primary
        return tabBarController
    }
}
