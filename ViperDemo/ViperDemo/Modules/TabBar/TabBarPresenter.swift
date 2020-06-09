//
//  TabBarPresenter.swift
//  ViperDemo
//
//  Created by Shreya on 06/06/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation
import UIKit

protocol TabBarPresentation {
    func viewDidLoad() -> Void
}

class TabBarPresenter {
//    let viewcontroller : TabBarView
    weak var view : TabBarView?
    
    typealias UseCase = (
        getCartCount : ( @escaping CartCountClosure ) -> Void , ()
    )
    
    let useCase : UseCase
    
    init(useCase : UseCase) {
        self.useCase = useCase
        
    }
    
}

extension TabBarPresenter : TabBarPresentation {
    func viewDidLoad() {
        self.useCase.getCartCount { (count) -> (Void) in
            self.view?.updateCartCount(count: count )
        }
    }
    
    
    
}


