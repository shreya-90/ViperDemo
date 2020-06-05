//
//  ProfileBuilder.swift
//  ViperDemo
//
//  Created by Shreya on 04/06/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation
import UIKit


class ProfileBuilder {
    
    static func build(usingNavigationFactory factory : NavigationFactory) -> UIViewController {
        
    let storyboard = UIStoryboard(name: "Profile", bundle: nil)
    let view = storyboard.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
    return factory(view)
        
    }
}
