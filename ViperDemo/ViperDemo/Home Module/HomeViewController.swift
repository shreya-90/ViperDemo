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
}

class HomeViewController: UIViewController {

    var presenter : HomePresentation!
    
    @IBOutlet weak var helloLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        self.helloLabel.text = "HelloViper"    //MVC way
        
         //VIPER way
        
        //presenter asks interactor to get data from server and on receiving presenter gives it back to the view
        self.presenter.viewDidLoad() // now presenters viewdidload will display VC data on load 
    }


}


extension HomeViewController : HomeView {
    func updateView(title: String) {
        self.helloLabel.text = title
    }
    
    
}
