//
//  BaseImage.swift
//  ViperDemo
//
//  Created by Shreya on 11/06/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation

struct BaseImage: Codable {
    let id: Int
    let name: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
    }
}
