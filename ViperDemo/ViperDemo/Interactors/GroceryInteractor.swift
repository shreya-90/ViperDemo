//
//  HomeInteractor.swift
//  ViperDemo
//
//  Created by Shreya on 29/04/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation


typealias SkuItem = (skuId:String, quantity:Int)

//protocol HomeUseCase {
//    func getTitle() -> HomeModel
//    func getGroceries(completion:groceriesClosure) -> Void
//    func addToCart(skuItem:SkuItem) -> Bool
//}
class GroceryInteractor {
    var service :GroceriesAPI
    var database : CartDB
    
    init(service:GroceriesAPI,database:CartDB) {
        self.service = service
        self.database = database
    }

}

extension GroceryInteractor  {
  
    func getTitle() -> HomeModel {
        return HomeModel(title: "Hello VIPER :)")
    }
    
    func getGroceries(categoryId: Int,completion: @escaping groceriesClosure) -> Void {
        self.service.fetchGroceries(categoryId: categoryId, completion: completion)
        
    }
    
    func getCategories(completion : @escaping categoriesClosure) -> Void {
        self.service.fetchCategories(completion: completion)
    }
    
    
}
