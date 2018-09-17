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
