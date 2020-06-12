//
//  Category.swift
//  GreenGrocery
//
//  Created by Viswanathan Venkitachelam on 11/06/19.
//  Copyright © 2019 LetsCodeEasy. All rights reserved.
//

struct CategoryResult: Codable {
    let categories: [Category]
    
    enum CodingKeys: String, CodingKey {
        case categories = "data"
    }
}

struct SingleCategoryResult: Codable {
    let category: Category
    
    enum CodingKeys: String, CodingKey {
        case category = "data"
    }
}

struct Category: Codable {
    let id: Int
    let category: String
    let description: String
    let categoryImage: BaseImage
    let groceryResult: GroceryResult?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case category
        case description = "details"
        case categoryImage = "image"
        case groceryResult = "groceries"
    }
}
