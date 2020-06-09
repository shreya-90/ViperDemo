//
//  Category.swift
//  GreenGrocery
//
//  Created by Viswanathan Venkitachelam on 11/06/19.
//  Copyright © 2019 LetsCodeEasy. All rights reserved.
//

struct Category: Codable {
    let id: Int
    let category: String
    let details: String
    let image: CategoryImage
    
    
//    private enum CodingKeys: String, CodingKey {
//        case id
//        case category
//        case description
//        case imageId = "image_id"
//        case categoryImage = "image"
//        case createdAt = "created_at"
//        case updatedAt = "updated_at"
//    }
}

struct CategoryImage: Codable {
    let id: Int
    let name: String
    
    
//    private enum CodingKeys: String, CodingKey {
//        case id
//        case name
//        
//    }
}
