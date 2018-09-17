//
//  ProductDetailInteractor.swift
//  VariousPatterns
//
//  Created by Hayoung Park on 2018. 9. 17..
//  Copyright © 2018년 Hayoung Park. All rights reserved.
//

import UIKit

class ProductDetailInteractor: NSObject {
    var presenter: ProductDetailPresenter?
    var product: Product!
    
    func fetchData() {
        guard let product = self.product else { return }
        
        presenter?.productDetailDidFetch(product)
    }
}
