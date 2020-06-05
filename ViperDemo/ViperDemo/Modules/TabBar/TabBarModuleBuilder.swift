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
        let tabBarController = GroceryTabBarController(tabs: tabs)   //programatically building tabbar
        return tabBarController
    }
}
