//
//  GroceryResult.swift
//  ViperDemo
//
//  Created by Shreya on 07/05/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation
struct GroceryResult:Codable {
    let groceries : [Grocery]
}


struct  Grocery : Codable {
    let skuid : String
    let title : String
    let image : String
    let details : String
    let price : Double
    
    enum CodingKeys : String, CodingKey {
        case skuid = "sku-id"
        case title
        case image = "product_image"
        case details
        case price
        
    }

}

