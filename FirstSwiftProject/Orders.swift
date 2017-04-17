//
//  Orders.swift
//  FirstSwiftProject
//
//  Created by Jessica Donahue on 4/9/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

import Foundation

class Orders: NSObject, NSCoding {
    
    var orders: [Order]?
    
    
    override init() {
        super.init()
    }
    
    // any property that is in our class we have to set a value for each one of those properties
    required init?(coder aDecoder: NSCoder) {
        
        self.orders = aDecoder.decodeObject(forKey: "orders") as! [Order]?
        
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.orders, forKey: "orders")
    }
    
    
    //helper methods that store orders to disk
    // 1. where to save it on disk 
    // 2. read orders from archive
    // 3. save orders into archive 
    class func archiveFilePath() -> String {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        return documentsDirectory.appendingPathComponent("cart.archive").path
    }
    
    class func readOrdersFromArchive() -> [Order]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: archiveFilePath()) as? [Order]
    }
    
    class func saveOrdersToArchive(orders: [Order]) -> Bool {
        return NSKeyedArchiver.archiveRootObject(orders, toFile: archiveFilePath())
    }
    
}





