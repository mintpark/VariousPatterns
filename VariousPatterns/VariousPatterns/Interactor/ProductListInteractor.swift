//
//  ProductListInteractor.swift
//  VariousPatterns
//
//  Created by Hayoung Park on 2018. 9. 17..
//  Copyright © 2018년 Hayoung Park. All rights reserved.
//

import UIKit

class ProductListInteractor: NSObject {
    var presenter: ProductListPresenter?
    
    func fetchData() {
        let products: [Product] = {
            var products = [Product]()
            for i in 0..<5 {
                let item = Product(id: i, title: "item\(i)", subTitle: "linked at \(i)", price: (i+1) * 1000)
                products.append(item)
            }
            
            return products
        }()
        
        presenter?.productListDidFetch(products)
    }
}
