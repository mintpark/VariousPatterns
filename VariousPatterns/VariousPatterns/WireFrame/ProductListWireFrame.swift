//
//  ProductListWireFrame.swift
//  VariousPatterns
//
//  Created by Hayoung Park on 2018. 9. 17..
//  Copyright © 2018년 Hayoung Park. All rights reserved.
//

import UIKit

class ProductListWireFrame: NSObject {
    class func createVC() -> UIViewController {
        let nav = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ProductNavigationController")
        if let view = nav.childViewControllers.first as? ProductListViewController {
            let presenter = ProductListPresenter()
            let interactor = ProductListInteractor()
            let wireFrame = ProductListWireFrame()
            
            view.presenter = presenter
            presenter.interactor = interactor
            presenter.view = view
            presenter.wireFrame = wireFrame
            interactor.presenter = presenter
            
            return nav
        } else {
            return UIViewController()
        }
    }
    
    func pushProductDetail(_ product: Product, from vc: ProductListViewController?) {
        if let productDetailVC = ProductDetailWireFrame.createVC(product) as? ProductDetailViewController {
            vc?.navigationController?.pushViewController(productDetailVC, animated: true)
        }
    }
    
}
