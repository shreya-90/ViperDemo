//
//  AccountTextControl.swift
//  GreenGrocery
//
//  Created by Viswanathan Venkitachelam on 06/10/19.
//  Copyright © 2019 LetsCodeEasy. All rights reserved.
//

import UIKit

fileprivate let accountTextControlNibName = "AccountTextControl"

class AccountTextControl: UIControl, ViewLoadable {
    
    var rules: [Rule] = []
    static var nibName: String = accountTextControlNibName
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    init() {
        super.init(frame: CGRect.zero)
        commonInit()
    }
    
    private func commonInit() {
        Bundle(for: type(of: self)).loadNibNamed(accountTextControlNibName, owner: self, options: nil)
        backgroundColor = .clear
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        contentView.layer.cornerRadius = 5.0
    }
    
    func configure(title: String, validationRules: [Rule]) {
        self.titleLabel.text = title
        self.setRules(rules: validationRules)
    }
}

extension AccountTextControl: FieldValidatable {
    
    var validationRules: [Rule] {
        get {
            return rules
        }
        set {
            rules = newValue
        }
    }
    
    var validationText: String {
        return self.inputTextField.text ?? ""
    }
    
    func setRules(rules: [Rule]) {
        validationRules.removeAll()
        validationRules.append(contentsOf: rules)
    }
    
    func setErrorMessage() -> Void {
        errorLabel?.text = self.rules
            .filter({ !$0.validate(value: self.validationText) })
            .first
            .map({ $0.errorMessage() })
    }
}
