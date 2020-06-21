//
//  AccountViewController.swift
//  ViperDemo
//
//  Created by Shreya on 16/06/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation
import UIKit

protocol AccountView : class {
    
}
class AccountViewController : UIViewController {
    
     var presenter : AccountPresentation?  //private let gives compile error? , if its property injection it cant be private
    override func viewDidLoad() {
        self.presenter?.viewDidLoad()
    }
}

extension AccountViewController : AccountView {
    
}
