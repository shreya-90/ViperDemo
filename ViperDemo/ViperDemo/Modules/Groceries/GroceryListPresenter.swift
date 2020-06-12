//
//  GroceryListPresenter.swift
//  ViperDemo
//
//  Created by Shreya on 10/06/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation

protocol GroceriesListPresentation {
    func viewDidLoad() -> Void
    func onThumnailUpdate(imageName: String, completion: @escaping imageClosure) -> Void
}


class GroceryListPresenter {
    var categoryId : Int
    var router : GroceryListRouting
    var useCase: UseCase
    weak var view: GroceryListView?
    
     typealias UseCase = (
          fetchGroceries : (_ categoryId : Int, _ completion : @escaping groceriesClosure) -> Void,
          fetchImage : (_ imageName: String,_ completion: @escaping imageClosure) -> Void,
          fetchThumbnail : (_ imageName: String, _ completion: @escaping imageClosure) -> Void
    )
    
    init(categoryId : Int, router : GroceryListRouting , useCase : UseCase) {
        self.categoryId = categoryId
        self.router = router
        self.useCase = useCase
    }
}

extension GroceryListPresenter : GroceriesListPresentation {
    func onThumnailUpdate(imageName: String, completion: @escaping imageClosure) {
        DispatchQueue.global(qos: .background).async {
            self.useCase.fetchThumbnail(imageName) { data in
                completion(data)
            }
        }
    }
    
    
    func viewDidLoad() {
        
        DispatchQueue.global(qos: .background).async {
            self.useCase.fetchGroceries(self.categoryId){  category in
                
                print("grocery - \(category)")
                
                self.useCase.fetchImage(category.categoryImage.name) { image in
                    
                    self.view?.updateCoverImage(imageData: image)
                    
                }
                
                DispatchQueue.main.async {
                    self.view?.updateCoverTitle(title: category.description.uppercased())
                    let grocerylist = category.groceryResult?.groceries
                        .compactMap {  GroceryItemViewModel(using: $0)}
                    self.view?.updateGroceries(groceriesList: grocerylist ?? [])
                    
                }
                
               
            }
        }
        
    }
    
  
}

