//
//  CartBuilder.swift
//  ViperDemo
//
//  Created by Shreya on 04/06/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation
import UIKit


class CartBuilder {
    
    
    static func build(usingNavigationFactory factory : NavigationFactory) -> UIViewController {
        
        let storyboard = UIStoryboard(name: "Cart", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "CartViewController") as! CartViewController
        return factory(view)
    }
}
