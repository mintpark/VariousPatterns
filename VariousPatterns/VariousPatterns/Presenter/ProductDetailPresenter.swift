//
//  ProductDetailPresenter.swift
//  VariousPatterns
//
//  Created by Hayoung Park on 2018. 9. 17..
//  Copyright © 2018년 Hayoung Park. All rights reserved.
//

import UIKit

class ProductDetailPresenter: NSObject {
    var view: ProductDetailViewController?
    var interactor: ProductDetailInteractor?
    
    func viewDidLoad() {
        interactor?.fetchData()
    }
    
    func productDetailDidFetch(_ product: Product) {
        view?.showProductDetail(product)
    }
}
