//
//  CartDB.swift
//  ViperDemo
//
//  Created by Shreya on 03/06/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation


typealias CartCountClosure =  (Int) -> (Void)
protocol CartDB {
    func getCartItem(using skuId : String) -> CartItem
    func updateCart(using cartItem : CartItem) -> Bool
    func delete(using skuId : String) -> Bool
    func getCount(closure : @escaping CartCountClosure) -> Void
}
