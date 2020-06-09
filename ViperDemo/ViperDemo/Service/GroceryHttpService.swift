//
//  GroceryHttpService.swift
//  ViperDemo
//
//  Created by Shreya on 08/06/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation
import Alamofire


class GroceryHttpService : HttpService {
    var sessionManager: SessionManager = SessionManager.default
    
    func request(urlRequest: URLRequestConvertible) -> DataRequest {
        return sessionManager.request(urlRequest).validate(statusCode: 200..<400)
    }
    
   
}
