//
//  CartInteractor.swift
//  ViperDemo
//
//  Created by Shreya on 05/06/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation

protocol CartUseCase {
    func getCartCount(closure :  @escaping CartCountClosure) -> Void
}

class CartInteractor {
    
    var database : CartDB
    
    init(database: CartDB){
        self.database = database
    }
}

extension CartInteractor : CartUseCase {
    
    
    func getCartCount(closure : @escaping CartCountClosure) {
        self.database.getCount(closure: closure)
    }
    
    
}
