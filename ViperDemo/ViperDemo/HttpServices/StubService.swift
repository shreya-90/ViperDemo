//
//  StubService.swift
//  ViperDemo
//
//  Created by Shreya on 07/05/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation


typealias groceriesClosure = (GroceryResult) -> Void
protocol  GroceriesAPI {
    func fetchGroceries(completion:groceriesClosure) -> ()
}


class StubService {
    static let shared : StubService  = StubService()
    
    private init(){
        
    }
}

extension StubService : GroceriesAPI{
    
    func fetchGroceries(completion:groceriesClosure) {
        if let url = Bundle.main.url(forResource: "products", withExtension: "json") {
            
            do {
                let data = try Data(contentsOf: url)
                let groceryResult = try JSONDecoder().decode(GroceryResult.self, from: data)
                completion(groceryResult)
            }catch{
                print(error)
            }
        }
    }
    
}
