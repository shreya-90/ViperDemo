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
    var notificationToken : NotificationToken?
    private init(){
         
    }
    
    deinit {
        notificationToken?.invalidate()
    }
}


extension RealmDatabase : CartDB {
    func getCartItem(using skuId: String) -> CartItem {
        let realm = try! Realm()
        guard let   realmObject = realm.objects(RealmCartItem.self).first(where: {$0.skuId == skuId}) else {
            return CartItem(skuId: skuId, value: 0)   //empty cartItem
        }
        return CartItem(realmCartItem: realmObject)
        
    }
    
    func delete(using skuId: String) -> Bool {
        let realm = try! Realm()
        do {
            try realm.write {
        
                if let realmObject = realm.objects(RealmCartItem.self).first(where: {
                    $0.skuId == skuId
                }){
                    realm.delete(realmObject)
                }
                
            }
        }catch {
            print("Error \(error)")
            return false
        }
        
        return true
    }
    

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
    
    func getCount(closure: @escaping CartCountClosure) {
        let realm = try! Realm()
        
        
        let results = realm.objects(RealmCartItem.self)
        notificationToken = results.observe({ _ in
            closure(results.count)
            
        })
        
    }
    
    
    
}
