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
    static let shared : GroceryService = GroceryService()
    private init(){
        
    }
}

extension GroceryService : ImageAPI
{
    func fetchThumbnail(imageName: String,completion: @escaping imageClosure) {
        do {
            try GroceryHttpRouter
            .downloadImage(imageName: imageName)
            .request(usingHttpService: httpService)
                .response(completionHandler: { (result) in
                    completion(result.data)
                })
            
        }catch {
             print("Something went wrong while fetching thumbnail")
        }
    }
    
    func fetchImage(imageName: String,completion: @escaping imageClosure) {
        do {
            try GroceryHttpRouter
                .downloadThumbnail(imageName: imageName)
                .request(usingHttpService: httpService)
                .response(completionHandler: { (result) in
                    completion(result.data)
                })
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
    
    func fetchGroceries(completion: (GroceryResult) -> Void) {
        
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
    
}
