//
//  ProductDetailWireFrame.swift
//  VariousPatterns
//
//  Created by Hayoung Park on 2018. 9. 17..
//  Copyright © 2018년 Hayoung Park. All rights reserved.
//

import UIKit

class ProductDetailWireFrame: NSObject {
    class func createVC(_ product: Product) -> UIViewController {
        if let view = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ProductDetailViewController") as? ProductDetailViewController {
            let presenter = ProductDetailPresenter()
            let interactor = ProductDetailInteractor()
            
            view.presenter = presenter
            presenter.interactor = interactor
            presenter.view = view
            interactor.presenter = presenter
            interactor.product = product
            
            return view
        } else {
            return UIViewController()
        }
    }
}
