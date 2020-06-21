//
//  GroceryStoryboard.swift
//  ViperDemo
//
//  Created by Shreya on 16/06/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation
import UIKit

enum GroceryStoryboard {
    case login
    case home
    case groceries
    case profile
    case cart
    
    var instance : UIStoryboard { //computed property getting set and returning a storyboard
        switch self {
        case .login:
            return UIStoryboard(name: "Login", bundle: nil)
        case .home:
            return UIStoryboard(name: "Home", bundle: nil)
        case .groceries:
            return UIStoryboard(name: "Groceries", bundle: nil)
        case .profile:
            return UIStoryboard(name: "Profile", bundle: nil)
        case .cart:
            return UIStoryboard(name: "Cart", bundle: nil)
            
        }
        
        
    }
}
