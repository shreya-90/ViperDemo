//
//  GroceryListViewController.swift
//  ViperDemo
//
//  Created by Shreya on 10/06/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import Foundation
import UIKit


protocol GroceryListView : class {
    func updateCoverTitle(title: String) -> Void
    func updateGroceries(groceriesList: [GroceryItemViewModel]) -> Void
    func updateCoverImage(imageData: UIImage) -> Void
    
}

class GroceryListViewController : UIViewController {
    
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var coverHeightConstraint: NSLayoutConstraint!
    private static let groceryCellID = "groceryCellID"
    @IBOutlet weak var coverDescriptionLabel: UILabel!
    
    var presenter: GroceriesListPresentation?
    
    var dataSource : [GroceryItemViewModel] = [] {
    
        didSet {
            self.tableview.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableview.register(UINib(nibName: "GroceryItemCell2", bundle: nil),
                                forCellReuseIdentifier: GroceryListViewController.groceryCellID)
        self.tableview.dataSource = self
        self.tableview.delegate = self
        self.tableview.estimatedRowHeight = 100
        self.tableview.rowHeight = UITableView.automaticDimension
        self.presenter?.viewDidLoad()
    }
}

extension GroceryListViewController : GroceryListView {
    func updateCoverTitle(title: String) {
        self.coverDescriptionLabel.text = title
    }
    
    func updateGroceries(groceriesList: [GroceryItemViewModel]) {
        self.dataSource = groceriesList
    }
    
    func updateCoverImage(imageData: UIImage) {
        //guard let image = UIImage(data: imageData) else { return }
        categoryImageView.image = imageData
        
    }
    
    
}


extension GroceryListViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         let viewModel = dataSource[indexPath.row]
        
         let cell = tableview.dequeueReusableCell(withIdentifier: GroceryListViewController.groceryCellID, for: indexPath) as! GroceryItemCell2
        
        cell.configure(using: viewModel)
        
        self.presenter?.onThumnailUpdate(imageName: viewModel.image) { image in
            DispatchQueue.main.async {
               // guard let data = data, let image = UIImage(data: data) else { return }
                cell.updateGroceryIcon(image: image)
            }
        }
        
        return cell
    }
    
    
}


extension GroceryListViewController : UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}
