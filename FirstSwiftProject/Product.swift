//
//  Product.swift
//  FirstSwiftProject
//
//  Created by Jessica Donahue on 4/8/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

import Foundation

// class file
class Product: NSObject, NSCoding {
    
    //varibles 
    var name: String?
    var productImage: String?
    var cellImage: String?
    var price: Double?
    
    
    override init() {
        super.init()
    }
    
    
    // any property that is in our class we have to set a value for each one of those properties
    required init?(coder aDecoder: NSCoder) {
        
        self.name = aDecoder.decodeObject(forKey: "name") as! String?
        self.productImage = aDecoder.decodeObject(forKey: "productImage") as! String?
        self.cellImage = aDecoder.decodeObject(forKey: "cellImage") as! String?
        self.price = aDecoder.decodeObject(forKey: "price") as! Double?

    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.productImage, forKey: "productImage")
        aCoder.encode(self.cellImage, forKey: "cellImage")
        aCoder.encode(self.price, forKey: "price")

        
    }
    
    
}
