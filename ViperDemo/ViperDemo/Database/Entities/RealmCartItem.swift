//
//  RealmCartItem.swift
//  ViperDemo
//
//  Created by Shreya on 04/06/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation

import RealmSwift


class RealmCartItem : Object{
    @objc dynamic var skuId : String = ""
    @objc dynamic var value : Int = 0
    @objc dynamic var updated : Date = Date()
 
    override static func primaryKey() -> String? {
        return "skuId"
    }
}


extension RealmCartItem {
    convenience init(cartItem:CartItem) {
        self.init()
        self.skuId = cartItem.skuId
        self.value = cartItem.value
    }
}

extension CartItem {
    
    init(realmCartItem : RealmCartItem){
        self.skuId = realmCartItem.skuId
        self.value = realmCartItem.value
    }
}
