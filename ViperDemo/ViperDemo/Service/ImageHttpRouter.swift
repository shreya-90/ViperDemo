//
//  ImageHttpRouter.swift
//  ViperDemo
//
//  Created by Shreya on 12/06/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation
import Alamofire


enum ImageHttpRouter {
    case downloadThumbnail(imageName: String)
    case downloadImage(imageName: String)
}


extension ImageHttpRouter  {
    var baseUrlString: String {
        return "https://letscodeeasy.com/groceryapi/public/api"
    }
    
    var path: String {
        switch (self) {
       
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
        case  .downloadThumbnail, .downloadImage:
            return nil
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        var url = try baseUrlString.asURL()
        url.appendPathComponent(path)
        
        var request = try URLRequest(url: url,method:method,headers:headers)
        request.httpBody = try body()
        
        return request
    }
    
    func download(usingImageHttpService httpService : ImageHttpService, completion : @escaping ImageDataResponse) throws  {
        try httpService.download(urlRequest: asURLRequest(), completion: completion)
    }
    
}

