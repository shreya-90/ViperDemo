//
//  AuthModel.swift
//  ViperDemo
//
//  Created by Shreya on 22/06/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation


struct AuthModel:Codable {
    let name: String
    let email: String
    let password: String
    
    
    init(name: String = "",email:String, password:String) {
        self.name = name
        self.email = email
        self.password = password
    }
}
