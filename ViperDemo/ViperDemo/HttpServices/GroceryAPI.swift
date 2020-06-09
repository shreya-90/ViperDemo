//
//  GroceryAPI.swift
//  ViperDemo
//
//  Created by Shreya on 08/06/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation
typealias groceriesClosure = (GroceryResult) -> Void
typealias categoriesClosure = ([Category]) -> Void
protocol  GroceriesAPI {
    func fetchCategories(completion:@escaping categoriesClosure) -> ()
    func fetchGroceries(completion:groceriesClosure) -> ()
}
