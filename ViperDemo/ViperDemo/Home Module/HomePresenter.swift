//
//  HomePresenter.swift
//  ViperDemo
//
//  Created by Shreya on 29/04/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation

protocol HomePresentation {
    func viewDidLoad() -> Void
}

class HomePresenter {
    weak var view :  HomeView?
    var interactor : HomeUseCase
    var router : HomeRouting
    
    init(view: HomeView,interactor:HomeUseCase,router:HomeRouting) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    
}


extension HomePresenter : HomePresentation {
    func viewDidLoad() {
        let homeModel = interactor.getTitle()
        
        DispatchQueue.main.async {
            self.view?.updateView(title: homeModel.title)
        }
        
        print(homeModel)
    }
    
    
}
