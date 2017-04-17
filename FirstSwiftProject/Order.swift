//
//  Order.swift
//  FirstSwiftProject
//
//  Created by Jessica Donahue on 4/9/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

import Foundation

class Order: NSObject, NSCoding {
    
    var order_id: Int?
    var product: Product?
    
    override init() {
        super.init()
    }
    // any property that is in our class we have to set a value for each one of those properties
    required init?(coder aDecoder: NSCoder) {
        
        self.order_id = aDecoder.decodeObject(forKey: "order_id") as! Int?
        self.product = aDecoder.decodeObject(forKey: "product") as! Product?
        
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.order_id, forKey: "order_id")
        aCoder.encode(self.product, forKey: "product")

    }
    
}
