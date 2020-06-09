//
//  HttpService.swift
//  ViperDemo
//
//  Created by Shreya on 08/06/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation
import Alamofire

protocol HttpService {
    var sessionManager : SessionManager { get set }
    func request(urlRequest : URLRequestConvertible) -> DataRequest
    
}
