//
//  AddBagControl.swift
//  ViperDemo
//
//  Created by Shreya on 30/04/20.
//  Copyright © 2020 Shreya Pallan. All rights reserved.
//

import UIKit
// typealias BagClosure = (Int) -> ()
typealias BagClosure = ((skuId:String,stepValue : Int)) -> ()
class AddBagControl: UIView {

    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var addToBagButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var stepLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    
//    var stepperValue : Int = 0 {
    var viewModel : CartValueViewModel! {
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
        //commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //commonInit()
        setUp()
    }
    
    
    func commonInit(){
//        let bundle = Bundle.init(for: AddBagControl.self)
        let nib = UINib(nibName: "AddBagControl", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
    }
    
   
    private func setUp() {
        Bundle(for: type(of: self)).loadNibNamed("AddBagControl", owner: self, options: nil)
        backgroundColor = .clear
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    @IBAction func addToBag(_ sender: UIButton) {
        self.viewModel = self.viewModel.onAddToBag()   //creating a new ViewModel and resetting the cureent one
        self.closure?((self.viewModel.id,self.viewModel.stepValue))
    }
    
    
    @IBAction func decrementButton(_ sender: UIButton) {
        
        self.viewModel = self.viewModel.onDecrement()
        //self.closure?(self.viewModel.stepValue)
        self.closure?((self.viewModel.id,self.viewModel.stepValue))
    }
    
    @IBAction func incrementButton(_ sender: UIButton) {
        
        self.viewModel = self.viewModel.onIncrement()
        //self.closure?(self.viewModel.stepValue)
        self.closure?((self.viewModel.id,self.viewModel.stepValue))
    }
    
   
    func configure(usimgViewModel viewModel: CartValueViewModel,bagClosure: @escaping BagClosure){
        self.viewModel = viewModel
         self.addToBagButton.setTitle(viewModel.title, for: .normal)
         self.viewModel.stepValue = 0
        self.closure = bagClosure
        applyTheme()
    }
    
    
    
}


class CartValueViewModel {
    let id: String
    var title : String
    var stepValue : Int
    var showStepper :  Bool
    
    init(id: String,stepValue:Int) {
        self.id = id
        self.title = "ADD TO BAG"
        self.stepValue = stepValue
        self.showStepper = stepValue > 0
    }
}

extension CartValueViewModel {
    func onAddToBag()->CartValueViewModel {
       return CartValueViewModel(id: id,stepValue: 1)
    }
    
    func onIncrement()->CartValueViewModel {
        guard self.stepValue < 10  else { return self  }
         return CartValueViewModel(id: id, stepValue: self.stepValue+1)
    }
    
    func onDecrement()->CartValueViewModel {
        guard self.stepValue > 0  else { return self }
         return CartValueViewModel(id: id, stepValue: self.stepValue-1)
    }
}

private extension AddBagControl {
    
    func applyTheme() -> Void {
        self.addToBagButton.backgroundColor = UIColor.primary
        self.plusButton.backgroundColor = UIColor.primary
        self.minusButton.backgroundColor = UIColor.primary
    }
}
