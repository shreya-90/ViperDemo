//
//  GroceryListModuleBuilder.swift
//  ViperDemo
//
//  Created by Shreya on 11/06/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation
import UIKit

class GroceriesListModuleBuilder {
    
    static func build(usingCategory category: (id: Int, title: String)) -> UIViewController{
        let storyboard =  UIStoryboard(name: "Groceries", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "GroceryListViewController") as! GroceryListViewController
         view.title = category.title.uppercased()
        let router = GroceryListRouter(viewController: view)
        let imageInteractor = ImageInteractor(service: GroceryService.shared)
        let groceriesInteractor = GroceryInteractor(service: GroceryService.shared, database: RealmDatabase.shared)
        
        let useCase = (
            fetchGroceries : groceriesInteractor.getGroceries,
            fetchImage : imageInteractor.fetchImage,
            fetchThumbnail : imageInteractor.fetchThumbnail
        )
        let presenter = GroceryListPresenter(categoryId: category.id, router: router, useCase: useCase)
        view.presenter = presenter
        presenter.view = view   //presenter is a string ref and view is a weak ref
        return view
    }
    
}
