//
//  HomePresenter.swift
//  ViperDemo
//
//  Created by Shreya on 29/04/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation

protocol HomePresentation {
    func viewDidLoad() -> Void
    func onAddToCart(skuItem:SkuItem) -> Void
}

class HomePresenter {
    weak var view :  HomeView?
    var interactor : HomeUseCase
    var router : HomeRouting
    
    init(view: HomeView,interactor:HomeUseCase,router:HomeRouting) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    
}


extension HomePresenter : HomePresentation {
    func onAddToCart(skuItem: SkuItem) {
        DispatchQueue.global(qos: .background).async {
             let updated =  self.interactor.addToCart(skuItem: skuItem)
            print("Add to cart updated with result \(updated )")
            DispatchQueue.main.async {
                ///Respond back to UI saying update succeeded
            }
        }
       
    }
    
    
    
    func viewDidLoad() {
        let homeModel = interactor.getTitle()
        
        DispatchQueue.main.async {
            self.view?.updateView(title: homeModel.title)
        }
        
        print(homeModel)
        
        
        DispatchQueue.global(qos: .background).async { [weak self] in
            //asynchronous work
            self?.interactor.getGroceries {  (result) in
                let groceryList = result.groceries.compactMap({ GroceryItemViewModel(using: $0) })
                DispatchQueue.main.async {
                    //callback
                    self?.view?.updateGroceries(groceriesList: groceryList)
                }
            }
           
        }
        
        
    }
    
    
}


struct GroceryItemViewModel {
    let title : String
    let details : String
    let image : String
    let price : String
    
    init(using groceryModel : Grocery ){
         self.title = groceryModel.title
        self.details = groceryModel.details
        self.image = groceryModel.image
        self.price = "$ \(groceryModel.price )"
    }
}
