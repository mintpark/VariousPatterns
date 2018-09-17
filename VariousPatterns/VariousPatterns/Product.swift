//
//  Product.swift
//  VariousPatterns
//
//  Created by Hayoung Park on 2018. 9. 17..
//  Copyright © 2018년 Hayoung Park. All rights reserved.
//

import Foundation

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
