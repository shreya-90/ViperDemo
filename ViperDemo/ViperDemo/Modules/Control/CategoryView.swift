//
//  CategoryView.swift
//  GreenGrocery
//
//  Created by Viswanathan Venkitachelam on 10/06/19.
//  Copyright © 2019 LetsCodeEasy. All rights reserved.
//

import UIKit

fileprivate let categoryViewNibName = "CategoryView"

typealias  CategorySelectionHandler = (_ categoryId : Int, _ title : String) -> Void

class CategoryView: UIView {
    static var nibName: String = categoryViewNibName
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var details: UILabel!
    
    var viewModel: CategoryItemViewModel?
    var handler: CategorySelectionHandler?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    init() {
        super.init(frame: CGRect.zero)  // 4.
        commonInit()
    }
    
    private func commonInit() {
        Bundle(for: type(of: self)).loadNibNamed("CategoryView", owner: self, options: nil)
        backgroundColor = .clear
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        contentView.layer.cornerRadius = 5.0
    }
    
    /// Configure using CategoryItemViewModel
    ///
    /// - Parameter viewModel: CategoryItemViewModel
    func configure(usingViewModel viewModel: CategoryItemViewModel, onComplete: (_ imageName: String) -> (),
                   onCategorySelectionHandler : @escaping CategorySelectionHandler) -> Void {
        self.viewModel = viewModel
        title.text = viewModel.title.uppercased()
        details.text = viewModel.details
        onComplete(viewModel.imageName)
        self.handler = onCategorySelectionHandler
    }
    
    /// UpdateImage
    ///
    /// - Parameter image: UIImage
    func updateImage(image: UIImage) -> Void {
        imageView.image = image
    }
    
    
    @IBAction func onCategoryTap(_ sender: UIButton) {
        guard let categoryId = viewModel?.id, let title = viewModel?.title else { return }
        self.handler?(categoryId, title)
        
    }
    
}
