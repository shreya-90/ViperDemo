//
//  CartItem.swift
//  ViperDemo
//
//  Created by Shreya on 04/06/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation



struct CartItem {
    let skuId : String
    let value : Int
    
    
    init(skuId: String, value: Int) {
        self.skuId = skuId
        self.value = value 
    }
}
