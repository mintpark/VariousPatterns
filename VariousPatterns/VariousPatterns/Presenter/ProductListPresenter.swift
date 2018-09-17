//
//  ProductListPresenter.swift
//  VariousPatterns
//
//  Created by Hayoung Park on 2018. 9. 17..
//  Copyright © 2018년 Hayoung Park. All rights reserved.
//

import UIKit

class ProductListPresenter: NSObject {
    var view: ProductListViewController?
    var interactor: ProductListInteractor?
    var wireFrame: ProductListWireFrame?
    
    func viewDidLoad() {
        interactor?.fetchData()
    }
    
    func productListDidFetch(_ products: [Product]) {
        view?.showProductList(products)
    }
    
    func pushProductDetail(_ product: Product) {
        wireFrame?.pushProductDetail(product, from: view)
    }
    
}
