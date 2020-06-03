//
//  RealmDatabase.swift
//  ViperDemo
//
//  Created by Shreya on 03/06/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation
import RealmSwift

class RealmDatabase {
    static let shared : RealmDatabase = RealmDatabase()
    private init(){
         
    }
    
}


extension RealmDatabase : CartDB {
   
    
    func updateCart(using cartItem: CartItem) -> Bool {
        let realm = try! Realm()
        do {
            try realm.write {
                realm.add(RealmCartItem(cartItem:cartItem),update: true)
            }
        }catch {
            print("Error \(error)")
            return false
        }
        
        return true
    }
    
    
    
    
}
