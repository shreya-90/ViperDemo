//
//  WindowPresenter.swift
//  ViperDemo
//
//  Created by Shreya on 16/06/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation
import UIKit


protocol WindowPresentation {
    func initialise()
}


class WindowPresenter {
    
    private let router : WindowRouting
    
    init(router: WindowRouting) {
        self.router = router
        self.initialise()
    }
}

extension WindowPresenter : WindowPresentation {
     func initialise() {
        self.router.routeTo(kind:.login)
    }
}
