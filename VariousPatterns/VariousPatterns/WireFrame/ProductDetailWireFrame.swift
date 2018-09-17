//
//  ProductDetailWireFrame.swift
//  VariousPatterns
//
//  Created by Hayoung Park on 2018. 9. 17..
//  Copyright © 2018년 Hayoung Park. All rights reserved.
//

import UIKit

let CommandProductDetail = "CommandProductDetail"

class ProductDetailWireFrame: WireFrameCommand {
    override func excute(_ notification: Notification) -> Bool? {
        if let product = notification.object as? Product,
            let productDetailVC = ProductDetailWireFrame.createVC(product) as? ProductDetailViewController {
            
            self.push(productDetailVC)
        }
        
        return false
    }
    
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
/*
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
*/
