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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        products = {
            var products = [Product]()
            for i in 0..<5 {
                let item = Product(id: i, title: "item\(i)", subTitle: "linked at \(i)", price: (i+1) * 1000)
                products.append(item)
            }
            return products
        }()
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
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "ProductDetailViewController") as? ProductDetailViewController else { return }
        vc.product = products[indexPath.row]

        self.navigationController?.pushViewController(vc, animated: true)
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

struct Product {
    var id: Int
    var title: String
    var subTitle: String?
    var price: Int
    var imageThumbnail: String?
    
    init(id: Int, title: String, subTitle: String = "", price: Int) {
        self.id = id
        self.title = title
        self.subTitle = subTitle
        self.price = price
    }
}
