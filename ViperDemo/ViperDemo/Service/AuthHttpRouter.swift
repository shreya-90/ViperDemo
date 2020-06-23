 //
//  AuthHttpRouter.swift
//  ViperDemo
//
//  Created by Shreya on 22/06/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation
import Alamofire
 
 //Define API endpoints, HttpRouter is used to create structure of the request
 
 enum AuthHttpRouter {   //cases for path/end points
    case login(AuthModel)
    case signup(AuthModel)
    
 }

 extension AuthHttpRouter : HttpRouter {  ///enum extended
    var baseUrlString: String {                 //computed properties
        return "https://letscodeeasy.com/groceryapi/public/api"
    }
    
    var path: String {
        switch self {
        
        case .login:
            return "/login"
        case .signup:
            return "/register"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .login,.signup:
            return .post
        }
        
    }
    
    var headers: HTTPHeaders? {
        switch self {
             case .login,.signup:
                return [
                    "Content-Type": "application/json; charset=UTF-8"
            ]
        }
        
    }
    
    var parameters : Parameters? {
        return nil  // as post request
    }
    
    func body() throws -> Data? {
        switch self {
        case .login(let user), .signup(let user) :
            return try JSONEncoder().encode(user)
        }
    }
 }
