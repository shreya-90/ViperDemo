//
//  ImageAPI.swift
//  ViperDemo
//
//  Created by Shreya on 09/06/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation
import UIKit

typealias imageClosure = (UIImage) -> Void
protocol ImageAPI {
    func fetchThumbnail(imageName: String,completion: @escaping imageClosure) -> Void
    func fetchImage(imageName: String,completion: @escaping imageClosure) -> Void
}
