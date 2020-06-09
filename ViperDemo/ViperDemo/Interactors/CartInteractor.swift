//
//  CartInteractor.swift
//  ViperDemo
//
//  Created by Shreya on 05/06/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation

//protocol CartUseCase {
//    func getCartCount(closure :  @escaping CartCountClosure) -> Void
//}

class CartInteractor {
    
    var database : CartDB
    
    init(database: CartDB){
        self.database = database
    }
}

extension CartInteractor   {
    
    
    func getCartCount(closure : @escaping CartCountClosure) {
        self.database.getCount(closure: closure)
    }
    
    func getCartItem(skuId:String)  -> CartItem {
        return self.database.getCartItem(using: skuId)
    }
    func addToCart(skuItem: SkuItem) -> Bool {
        
        guard   skuItem.quantity > 0 else {
            return self.database.delete(using: skuItem.skuId )
        }
        return self.database.updateCart(using: CartItem(skuId: skuItem.skuId, value: skuItem.quantity ))
    } 
}
