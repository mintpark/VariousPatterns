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
    
    var presenter: ProductDetailPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.viewDidLoad()    // product didn't push yet
    }
    
    @IBAction func showPrevDetailView(_ sender: Any) {
        let item = Product(id: 111111, title: "prev", subTitle: "this is prev item via command", price: 111111)
        self.post(notificationName: CommandProductDetail, product: item)
        
    }
    
    @IBAction func showNextDetailView(_ sender: Any) {
        let item = Product(id: 222222, title: "next", subTitle: "this is next item via command", price: 222222)
        self.post(notificationName: CommandProductDetail, product: item)
    }
    
    func showProductDetail(_ product: Product) {
        titleLabel.text = product.title
        subtitleLabel.text = product.subTitle
        priceLabel.text = String(format: "%zd", product.price)
    }
}
