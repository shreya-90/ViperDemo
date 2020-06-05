//
//  GroceryTabBarController.swift
//  ViperDemo
//
//  Created by Shreya on 04/06/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import UIKit

typealias GroceryTabs = (         //returned by Tab Router , same as submodules but exposed to                                       tabbarviewcontroller
    home : UIViewController,
    cart : UIViewController,
    profile : UIViewController
)
protocol TabBarView : class {
    func updateCartCount(count : Int) -> Void
}

class GroceryTabBarController: UITabBarController {

    let cartTab : UIViewController
    var presenter : TabBarPresentation?
    init(tabs : GroceryTabs,presenter : TabBarPresentation) {
        self.presenter = presenter
        cartTab = tabs.cart
        super.init(nibName: nil, bundle : nil)
        viewControllers = [tabs.home, tabs.cart, tabs.profile ]
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.viewDidLoad() 
        // Do any additional setup after loading the view.
    }
    
}


extension GroceryTabBarController : TabBarView {
    func updateCartCount(count: Int) {
        self.cartTab.tabBarItem.badgeValue = "\(count)"
    }
    
    
}
