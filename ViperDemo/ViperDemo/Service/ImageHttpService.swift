//
//  ImageHttpService.swift
//  ViperDemo
//
//  Created by Shreya on 12/06/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation

import Alamofire
import AlamofireImage

typealias ImageDataResponse = (DataResponse<Image>) -> Void

class ImageHttpService  {
    let imageDownloader : ImageDownloader
    
    static let shared : ImageHttpService = ImageHttpService()
    
    private init() {
        imageDownloader = ImageDownloader()
    }
    
    func download(urlRequest: URLRequestConvertible, completion : @escaping ImageDataResponse) -> Void {
         imageDownloader.download(urlRequest, completion: completion)
    }
    
    
}
