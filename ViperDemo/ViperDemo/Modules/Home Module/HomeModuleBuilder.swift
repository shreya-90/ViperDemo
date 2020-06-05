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
    
    
    
    static func build(usingNavigationFactory factory : NavigationFactory) -> UIViewController {
       let storyboard =  UIStoryboard(name: "Home", bundle: nil)
       let view = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        let interactor = HomeInteractor(service: StubService.shared, database: RealmDatabase.shared  )
        let router = HomeRouter(vc: view)
        let presenter = HomePresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        return factory(view)
    }
}
