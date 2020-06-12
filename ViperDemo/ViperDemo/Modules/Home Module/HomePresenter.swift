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
    func onFetchThumbnail(imageName:String, completion : @escaping imageClosure ) -> Void
    func onCategorySelection(usingCategory category: (id: Int, title: String)) -> Void
}

class HomePresenter {
    weak var view :  HomeView?
    var router : HomeRouting?
    
    typealias UseCase = (
//        getGroceries : (groceriesClosure) -> Void,
        getCategories : (@escaping  categoriesClosure) -> Void,
        addToCart :  (SkuItem) -> Bool,
        getCartItem : (String) -> CartItem,
        fetchThumbnail : (_ imageName: String, _ completion : @escaping imageClosure) -> Void
    )
    var useCase : UseCase?
    
    init(view: HomeView,useCase:HomePresenter.UseCase,router:HomeRouting) {
        self.view = view
        self.useCase = useCase
        self.router = router
    }
    
    
}


extension HomePresenter : HomePresentation {
   
    func onCategorySelection(usingCategory category: (id: Int, title: String)) {
        self.router?.routeToGroceryListing(usingCategory: category)
    }
    
    func onFetchThumbnail(imageName: String, completion: @escaping imageClosure) {
        self.useCase?.fetchThumbnail(imageName){  image in
            completion(image)
        }
    }
    
    func onAddToCart(skuItem: SkuItem) {
        DispatchQueue.global(qos: .background).async {
            let updated =  self.useCase?.addToCart(skuItem)
            print("Add to cart updated with result \(updated)")
            DispatchQueue.main.async {
                ///Respond back to UI saying update succeeded
            }
        }
       
    }
    
    
    
    func viewDidLoad() {

        
        
        DispatchQueue.global(qos: .background).async { [weak self] in
            //asynchronous work
            self?.useCase?.getCategories {  (categories) in
                
                print("Load categories \(categories)")
                self?.view?.loadCategories(categoriesList: categories.compactMap({
                    
                    CategoryItemViewModel(using: $0)
                    
                }))
            }
           
        }
        
    }
    
    
}



struct CategoryItemViewModel {
    let id : Int
    let title : String
    let details : String
    let imageName : String
    
    init(using categoryModel: Category) {
        self.id = categoryModel.id
        self.title = categoryModel.category
        self.details = categoryModel.description
        self.imageName = categoryModel.categoryImage.name
    }
}

struct GroceryItemViewModel {
    let id: Int
    let title : String
    let details : String
    let image : String
//    let price : String
//    let cartValue : CartValueViewModel
    
    init(using groceryModel : Grocery){
        self.id = groceryModel.id
        self.title = groceryModel.title
        self.details = groceryModel.details
        self.image = groceryModel.image.name
//        self.price = "$ \(groceryModel.price )"
//        self.cartValue = CartValueViewModel(id: cartItem.skuId, stepValue: cartItem.value )
    }
}
