//
//  ImageInteractor.swift
//  ViperDemo
//
//  Created by Shreya on 09/06/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation



final class ImageInteractor {
    
    let service : ImageAPI
    
    init(service : ImageAPI){
        self.service = service
    }
}


extension ImageInteractor {
    func fetchThumbnail(imageName: String,completion: @escaping imageClosure) -> Void {
        self.service.fetchThumbnail(imageName: imageName, completion: completion)
    }
    func fetchImage(imageName: String,completion: @escaping imageClosure) -> Void {
         self.service.fetchImage(imageName: imageName, completion: completion)
    }
}
