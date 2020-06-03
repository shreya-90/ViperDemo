//
//  CartDB.swift
//  ViperDemo
//
//  Created by Shreya on 03/06/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation



protocol CartDB {
    func updateCart(using cartItem : CartItem) -> Bool
}
