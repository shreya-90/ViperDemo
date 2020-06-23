//
//  SignUpError.swift
//  ViperDemo
//
//  Created by Shreya on 22/06/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation


struct SignUpError : Codable {
    let validationErrors : ValidationErrors
    enum CodingKeys: String,CodingKey {
        case validationErrors = "validation_errors"
    }
}



struct ValidationErrors : Codable {
    let name, email, password : [String]?
}
