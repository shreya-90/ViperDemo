//
//  NavigationBuilder.swift
//  ViperDemo
//
//  Created by Shreya on 11/05/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation
import UIKit

typealias NavigationFactory = (UIViewController) -> UINavigationController  // same as build function below hence factory , pass the navigation builder factory  as a dependency to your home view builder , can use this method to embed any view inside navigation controller

class NavigationBuilder {
    
    
    static func build(rootView:UIViewController) -> UINavigationController {
        
       //Addding some styling using NSAttributes declared
        let textStyleAttributes : [NSAttributedString.Key : Any] = [
            .foregroundColor: UIColor.white,
            .font : UIFont.init(name: "AvenirNext-DemiBold" , size : 22.0)!
        ]
        
        let largeTextStyleAttributes : [NSAttributedString.Key : Any] = [
            .foregroundColor: UIColor.white,
            .font : UIFont.init(name: "AvenirNext-DemiBold" , size : 28.0)!
        ]
        
        let navigationController = UINavigationController(rootViewController: rootView)
        
        //styling
        navigationController.navigationBar.barTintColor = UIColor.red
        navigationController.navigationBar.tintColor = UIColor.white
        navigationController.navigationBar.titleTextAttributes = textStyleAttributes
        navigationController.navigationBar.largeTitleTextAttributes = largeTextStyleAttributes
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.prefersLargeTitles = true
        
        return navigationController
    }
}
