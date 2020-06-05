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

class GroceryTabBarController: UITabBarController {

    
    init(tabs : GroceryTabs) {
        super.init(nibName: nil, bundle : nil)
        viewControllers = [tabs.home, tabs.cart, tabs.profile ]
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
