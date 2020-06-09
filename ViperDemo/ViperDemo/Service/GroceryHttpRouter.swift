//
//  GroceryHttpRouter.swift
//  ViperDemo
//
//  Created by Shreya on 08/06/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation

import Alamofire


enum GroceryHttpRouter {   //cases for path
    case getGroceryCategories
    case getGroceries(categoryId: String)
    case downloadThumbnail(imageName: String)
    case downloadImage(imageName: String)
}

extension GroceryHttpRouter: HttpRouter {
    var baseUrlString: String {
        return "https://letscodeeasy.com/groceryapi/public/api"
    }
    
    var path: String {
        switch (self) {
        case .getGroceryCategories:
            return "/categories"
        case .getGroceries(let categoryId):
            return "/category/\(categoryId)"
        case .downloadThumbnail(let imageName):
            return "/thumbnail/show/\(imageName)"
        case .downloadImage(let imageName):
            return "/image/show/\(imageName)"
        }
    }
    
    var method: HTTPMethod {
         return .get
    }
    
    var headers: HTTPHeaders? {
        return [
            "Content-Type": "application/json; charset=UTF-8"
        ]
    }
    
    func body() throws -> Data? {
        switch self {
        case .getGroceryCategories, .getGroceries, .downloadThumbnail, .downloadImage:
            return nil
        }
    }
    
    
}
