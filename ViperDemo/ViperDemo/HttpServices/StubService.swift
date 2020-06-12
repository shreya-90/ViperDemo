//
//  StubService.swift
//  ViperDemo
//
//  Created by Shreya on 07/05/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation





class StubService {
    static let shared : StubService  = StubService()
    
    private init(){
        
    }
}

extension StubService : GroceriesAPI{
   
    
    func fetchCategories(completion: @escaping categoriesClosure) {
        fatalError("No implementation for this")
    }
    func fetchGroceries(categoryId: Int,completion:groceriesClosure) {
        if let url = Bundle.main.url(forResource: "products", withExtension: "json") {
            
            do {
                let data = try Data(contentsOf: url)
                let groceryResult = try JSONDecoder().decode(Category.self, from: data)
                completion(groceryResult)
            }catch{
                print(error)
            }
        }
    }
    
}
