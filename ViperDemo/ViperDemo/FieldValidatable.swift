//
//  FieldValidatable.swift
//  ViperDemo
//
//  Created by Shreya on 16/06/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation
import UIKit

protocol FieldValidatable {
    var validationRules: [Rule] { get }
    var validationText: String { get }
}
