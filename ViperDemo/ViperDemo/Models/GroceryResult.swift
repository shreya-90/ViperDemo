//
//  GroceryResult.swift
//  GreenGrocery
//
//  Created by Viswanathan Venkitachelam on 25/05/19.
//  Copyright © 2019 LetsCodeEasy. All rights reserved.
//

struct GroceryResult: Codable {
    let groceries: [Grocery]
    
    enum CodingKeys: String, CodingKey {
        case groceries = "data"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        groceries = try container.decode(Array<Grocery>.self, forKey: .groceries)
    }
}

struct Grocery: Codable {
    let id: Int
    let title: String
    let categoryId: Int
    let imageId: Int
    let details: String
    let image: BaseImage
    
    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case categoryId
        case imageId = "image_id"
        case details
        case image
    }
}
