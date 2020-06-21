//
//  GroceryListRouter.swift
//  ViperDemo
//
//  Created by Shreya on 10/06/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation
import UIKit


protocol GroceryListRouting {
    
}
class GroceryListRouter {
    var viewController: UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}


extension GroceryListRouter : GroceryListRouting {
    
}
