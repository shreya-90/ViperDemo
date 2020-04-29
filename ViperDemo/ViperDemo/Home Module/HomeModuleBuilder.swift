//
//  HomeModuleBuilder.swift
//  ViperDemo
//
//  Created by Shreya on 29/04/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation
import UIKit

class HomeModuleBuilder {
    
    
    
    static func build() -> UIViewController {
       let storyboard =  UIStoryboard(name: "Main", bundle: nil)
       let view = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        let interactor = HomeInteractor()
        let router = HomeRouter(vc: view)
        let presenter = HomePresenter(view: view, interactor: interactor, router: router)
       
        
        
        view.presenter = presenter
        return view
    }
}
