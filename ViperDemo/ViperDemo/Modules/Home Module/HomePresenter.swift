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
    func onFetchThumbnail(imageName:String, completion : @escaping (Data) -> Void) -> Void
}

class HomePresenter {
    weak var view :  HomeView?
    var router : HomeRouting
    
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
   
    func onFetchThumbnail(imageName: String, completion: @escaping (Data) -> Void) {
        self.useCase?.fetchThumbnail(imageName,{  data in
            
            guard let data = data else { return }
            
            completion(data)
        })
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
//        let homeModel = interactor.getTitle()
//
//        DispatchQueue.main.async {
//            self.view?.updateView(title: homeModel.title)
//        }
//
//        print(homeModel)
        
        
        DispatchQueue.global(qos: .background).async { [weak self] in
            //asynchronous work
            self?.useCase?.getCategories {  (categories) in
//                let groceryList = result.groceries.compactMap({ grocery -> GroceryItemViewModel in
//                    let cartItem = self?.useCase?.getCartItem(grocery.skuid)
//                    return GroceryItemViewModel(using: grocery, cartItem:cartItem!  ) })
//                DispatchQueue.main.async {
//                    //callback
//                    self?.view?.updateGroceries(groceriesList: groceryList)
//                }
                
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
    
    init(using CategoryModel : Category) {
        self.id = CategoryModel.id
        self.title = CategoryModel.category
        self.details = CategoryModel.details
        self.imageName = CategoryModel.image.name
    }
}

struct GroceryItemViewModel {
    let id: String
    let title : String
    let details : String
    let image : String
    let price : String
    let cartValue : CartValueViewModel
    
    init(using groceryModel : Grocery ,cartItem : CartItem){
        self.id = groceryModel.skuid
        self.title = groceryModel.title
        self.details = groceryModel.details
        self.image = groceryModel.image
        self.price = "$ \(groceryModel.price )"
        self.cartValue = CartValueViewModel(id: cartItem.skuId, stepValue: cartItem.value )
    }
}
