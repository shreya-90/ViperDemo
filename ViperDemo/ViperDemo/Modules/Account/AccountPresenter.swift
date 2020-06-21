//
//  AccountPresenter.swift
//  ViperDemo
//
//  Created by Shreya on 16/06/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation


protocol AccountPresentation {
    func viewDidLoad()
}
class AccountPresenter {
    weak var view : AccountView?
    private let router : AccountRouting
    
    init(router : AccountRouting) {
        self.router = router
    }
}


extension AccountPresenter : AccountPresentation {
    func viewDidLoad() {
        self.router.showLogin()
    }
}
