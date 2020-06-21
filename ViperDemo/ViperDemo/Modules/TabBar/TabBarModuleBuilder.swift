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
    
    
    static  func build() -> UITabBarController {
    
        let submodules = (
                    home : HomeModuleBuilder.build(usingNavigationFactory: NavigationBuilder.build),
                    cart : CartBuilder.build(usingNavigationFactory: NavigationBuilder.build),
                    profile : ProfileBuilder.build(usingNavigationFactory: NavigationBuilder.build)
                )
        
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
