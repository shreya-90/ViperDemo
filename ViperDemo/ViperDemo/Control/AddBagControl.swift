//
//  AddBagControl.swift
//  ViperDemo
//
//  Created by Shreya on 30/04/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import UIKit

class AddBagControl: UIView {

    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var addToBagButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var stepLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    
//    var stepperValue : Int = 0 {
    var viewModel : AddBagViewModel! {
        didSet {
            
//            let isHidden = stepperValue > 0
            let isHidden =  viewModel.showStepper
            addToBagButton.isHidden = isHidden
            plusButton.isHidden = !isHidden
            minusButton.isHidden = !isHidden
            stepLabel.isHidden = !isHidden
            stepLabel.text = "\(viewModel.stepValue)"
            print("\(viewModel.stepValue)")
        }
    }
    
    var closure : BagClosure?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    
    func commonInit(){
//        let bundle = Bundle.init(for: AddBagControl.self)
        let nib = UINib(nibName: "AddBagControl", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
    }
    
    
    @IBAction func addToBag(_ sender: UIButton) {
        self.viewModel = self.viewModel.onAddToBag()   //creating a new ViewModel and resetting the cureent one
        self.closure?(self.viewModel.stepValue)
    }
    
    
    @IBAction func decrementButton(_ sender: UIButton) {
        
        self.viewModel = self.viewModel.onDecrement()
        self.closure?(self.viewModel.stepValue)
    }
    
    @IBAction func incrementButton(_ sender: UIButton) {
        
        self.viewModel = self.viewModel.onIncrement()
        self.closure?(self.viewModel.stepValue)
    }
    
    typealias BagClosure = (Int) -> ()
    func configure(usimgViewModel viewModel: AddBagViewModel,bagClosure: @escaping BagClosure){
        self.viewModel = viewModel
         self.addToBagButton.setTitle(viewModel.title, for: .normal)
         self.viewModel.stepValue = 0
        self.closure = bagClosure
    }
    
    
    
}


class AddBagViewModel {
    var title : String
    var stepValue : Int
    var showStepper :  Bool
    
    init(title:String,stepValue:Int) {
        self.title = title
        self.stepValue = stepValue
        self.showStepper = stepValue > 0
    }
}

extension AddBagViewModel {
    func onAddToBag()->AddBagViewModel {
       return AddBagViewModel(title: self.title, stepValue: 1)
    }
    
    func onIncrement()->AddBagViewModel {
        guard self.stepValue < 10  else { return self  }
         return AddBagViewModel(title: self.title, stepValue: self.stepValue+1)
    }
    
    func onDecrement()->AddBagViewModel {
        guard self.stepValue > 0  else { return self }
         return AddBagViewModel(title: self.title, stepValue: self.stepValue-1)
    }
}
