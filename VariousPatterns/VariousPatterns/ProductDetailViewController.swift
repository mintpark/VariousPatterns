//
//  ProductDetailViewController.swift
//  VariousPatterns
//
//  Created by Hayoung Park on 2018. 8. 20..
//  Copyright © 2018년 Hayoung Park. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    
    var product: Product!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // instantiate() calls bindData() faster than viewDidLoad(). Then IBOutlets would be nil.
        titleLabel.text = product.title
        priceLabel.text = String(format: "%zd", product.price)
        subtitleLabel.text = product.subTitle
    }
}
