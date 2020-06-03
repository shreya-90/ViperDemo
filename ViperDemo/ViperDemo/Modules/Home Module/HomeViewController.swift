//
//  ViewController.swift
//  ViperDemo
//
//  Created by Shreya on 29/04/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import UIKit


protocol HomeView : class { 
    func updateView(title:String) -> Void
    func updateGroceries(groceriesList : [GroceryItemViewModel])
}

class HomeViewController: UIViewController {

    var presenter : HomePresentation!
    var dataSource : [GroceryItemViewModel] = [] {
        
        didSet {
            self.tableView.reloadData()
        }
    }
    
    private static let groceryCellID = "groceryCellID"
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var addBagControl: AddBagControl!
    @IBOutlet weak var helloLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        self.helloLabel.text = "HelloViper"    //MVC way
        
         //VIPER way
        
        //presenter asks interactor to get data from server and on receiving presenter gives it back to the view
        self.presenter.viewDidLoad() // now presenters viewdidload will display VC data on load
        
        //MVVM
        let viewModel = AddBagViewModel(title: "Add To Bag" , stepValue: 0)
        addBagControl.configure(usimgViewModel: viewModel ) { (stepValue) in
            print("Current value is \(stepValue)")
        }
        
        self.tableView.register(UINib(nibName: "GroceryItemCell2", bundle: nil), forCellReuseIdentifier:  HomeViewController.groceryCellID)
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
    }


}


extension HomeViewController : HomeView {
    func updateView(title: String) {
        self.helloLabel.text = title
    }
    
    func updateGroceries(groceriesList : [GroceryItemViewModel]){
        print(groceriesList)
        self.dataSource = groceriesList
//        self.tableView.reloadData()
    }
    
}


extension HomeViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = dataSource[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeViewController.groceryCellID, for: indexPath) as! GroceryItemCell2
        cell.configure(using: viewModel)
        return cell
        
    }
    
    
}


extension HomeViewController :UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
