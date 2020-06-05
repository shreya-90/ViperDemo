//
//  TabBarRouter.swift
//  ViperDemo
//
//  Created by Shreya on 04/06/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation
import UIKit


class TabBarRouter {
    
    
    var viewController : UIViewController
    
    
    typealias SubModules = (         //modules required to create the tabs, internal
        home : UIViewController,
        cart : UIViewController,
        profile : UIViewController
    )
    
    
    init(viewController : UIViewController){
         self.viewController = viewController
    }
}



extension TabBarRouter {
    
    static func tabs(usingSubmodules subModules : SubModules) ->  GroceryTabs {   //returns tab elements
        
        let homeTabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "tab-home"), tag : 11)
        let profileTabBarItem = UITabBarItem(title: "profile", image: UIImage(named: "tab-profile"), tag : 12)
        let cartTabBarItem = UITabBarItem(title: "cart", image: UIImage(named: "tab-cart"), tag : 13)
        
        subModules.home.tabBarItem = homeTabBarItem
        subModules.cart.tabBarItem = cartTabBarItem
        subModules.profile.tabBarItem = profileTabBarItem
        
        
        return (
            home: subModules.home,
            cart: subModules.cart,
            profile : subModules.profile
        )
    }
}
