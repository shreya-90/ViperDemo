//
//  HomeInteractor.swift
//  ViperDemo
//
//  Created by Shreya on 29/04/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation


typealias SkuItem = (skuId:String, quantity:Int)

protocol HomeUseCase {
    func getTitle() -> HomeModel
    func getGroceries(completion:groceriesClosure) -> Void
    func addToCart(skuItem:SkuItem) -> Bool
}
class HomeInteractor {
    var service :GroceriesAPI
    var database : CartDB
    
    init(service:GroceriesAPI,database:CartDB) {
        self.service = service
        self.database = database
    }

}

extension HomeInteractor : HomeUseCase {
    func addToCart(skuItem: SkuItem) -> Bool {
       return self.database.updateCart(using: CartItem(skuId: skuItem.skuId, value: skuItem.quantity ))
    }
    
    
    
    func getTitle() -> HomeModel {
        return HomeModel(title: "Hello VIPER :)")
    }
    
    func getGroceries(completion:groceriesClosure) -> Void {
        service.fetchGroceries { (results) in
            completion(results)
            
        }
    }
    
    
}
