//
//  HomeRouter.swift
//  ViperDemo
//
//  Created by Shreya on 29/04/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//
import UIKit
import Foundation

protocol  HomeRouting {
    
}

class HomeRouter {
    var viewController : UIViewController
    
    init(vc:UIViewController) {
        self.viewController = vc
    }
}


extension HomeRouter : HomeRouting {
    
}
