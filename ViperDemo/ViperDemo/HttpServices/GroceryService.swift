//
//  GroceryService.swift
//  ViperDemo
//
//  Created by Shreya on 08/06/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation
import Alamofire

class GroceryService {
    private lazy var httpService = GroceryHttpService()
    private lazy var imageHttpService = ImageHttpService.shared
    static let shared : GroceryService = GroceryService()
    private init(){
        
    }
}

extension GroceryService : ImageAPI
{
    func fetchThumbnail(imageName: String,completion: @escaping imageClosure) {
        do {
            try ImageHttpRouter
            .downloadThumbnail(imageName: imageName)
            .download(usingImageHttpService:imageHttpService){ response in
                guard let image = response.result.value else { return }
                    completion(image)
            }
            
        } catch {
             print("Something went wrong while fetching thumbnail")
        }
    }
    
    func fetchImage(imageName: String,completion: @escaping imageClosure) {
        do {
            try ImageHttpRouter
                .downloadImage(imageName: imageName)
                .download(usingImageHttpService:imageHttpService){ response in
                    guard let image = response.result.value else { return }
                    completion(image)
            }
        } catch {
             print("Something went wrong while fetching images")
        }
    }
    
    
}

extension GroceryService :  GroceriesAPI {
    
    
    func fetchCategories(completion: @escaping ([Category]) -> Void) {
        //start making the htto calls to fetch categories
        
        do {
            try GroceryHttpRouter
                .getGroceryCategories
                .request(usingHttpService: httpService)
                .responseJSON { (result) in
                let categories = GroceryService.parseCategories(result: result)
                completion(categories)
        }
        } catch {
            print("Something went wrong while fetching categories")
        }
    }
    
    func fetchGroceries(categoryId: Int,completion: @escaping (Category) -> Void) {
        do {
            try GroceryHttpRouter
                .getGroceries(categoryId: categoryId)
                .request(usingHttpService: httpService)
                .responseJSON { (result) in
                    let groceriesResult = GroceryService.parseGroceriesResult(result: result)
                    guard let category = groceriesResult else { return }
                    completion(category)
            }
        } catch {
            print("Something went wrong while parsing groceries response: \(error)")
        }
    }
    
    
}


extension GroceryService {

    private static func parseCategories(result: DataResponse<Any>) -> [Category] {
            
            guard [200, 201].contains(result.response?.statusCode), let data = result.data else { return [] }
            
            do {
                let categoriesArrayDictionary = try JSONDecoder().decode([String:[Category]].self, from: data)
                let categories = categoriesArrayDictionary["data"]!
                return categories
            } catch {
                print("Something went wrong while parsing categories response")
            }
            return []
    }
    
     private static func parseGroceriesResult(result: DataResponse<Any>) -> Category? {
        guard [200, 201].contains(result.response?.statusCode), let data = result.data else { return nil }
        do {
            let singleResult = try JSONDecoder().decode(SingleCategoryResult.self, from: data)
            return singleResult.category
        } catch {
            print("Something went wrong while parsing groceries response: \(error)")
        }
        return nil
    }
    
}
