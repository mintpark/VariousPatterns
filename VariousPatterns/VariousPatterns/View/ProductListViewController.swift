//
//  ViewController.swift
//  VariousPatterns
//
//  Created by Hayoung Park on 2018. 8. 20..
//  Copyright © 2018년 Hayoung Park. All rights reserved.
//

import UIKit

class ProductListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var products = [Product]()
    
    var presenter: ProductListPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
    
    func showProductList(_ products: [Product]) {
        self.products = products
        tableView.reloadData()
    }
}

extension ProductListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductListTableViewCell", for: indexPath) as? ProductListTableViewCell else { return UITableViewCell() }
        cell.bindData(products[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = products[indexPath.row]
        presenter.pushProductDetail(product)
    }
}

class ProductListTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    func bindData(_ product: Product) {
        titleLabel?.text = product.title
        priceLabel?.text = String(format: "%zd", product.price)
    }
}
