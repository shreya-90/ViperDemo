//
//  WindowBuilder.swift
//  ViperDemo
//
//  Created by Shreya on 16/06/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation
import UIKit

class WindowBuilder {
    
    static func build(frame: CGRect)  -> UIWindow {
        let window = Window(frame: frame)
        let router = WindowRouter(window,
                                  subModules:(
                                  accountModule: AccountBuilder.build,
                                  tabbarModule: TabBarModuleBuilder.build
            )
        )
        let presenter = WindowPresenter(router: router)
        window.presenter = presenter
         return window
    }
}
