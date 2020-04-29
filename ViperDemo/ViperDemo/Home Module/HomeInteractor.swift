//
//  HomeInteractor.swift
//  ViperDemo
//
//  Created by Shreya on 29/04/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation

protocol HomeUseCase {
    func getTitle() -> HomeModel
}
class HomeInteractor {

}

extension HomeInteractor : HomeUseCase {
    func getTitle() -> HomeModel {
        return HomeModel(title: "Hello VIPER :)")
    }
    
    
}
