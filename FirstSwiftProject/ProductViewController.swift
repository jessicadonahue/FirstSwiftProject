//
//  ProductViewController.swift
//  FirstSwiftProject
//
//  Created by Jessica Donahue on 4/7/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {

    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    
    var product: Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //unwrap the product object because it is optional
        if let p = product {
            productNameLabel.text = p.name
            
            //unwrap image view 
            if let i = p.productImage {
                productImageView.image = UIImage(named: i)
            }
        }
        
    }
    


    @IBAction func addToCartPressed(_ sender: Any) {
        print("button tapped")
        
        guard let product = product, let price = product.price else {
            return
        }
        
        
        let alertController = UIAlertController(title: "Saved to Cart", message: "Saved to cart with a price of $\(price)", preferredStyle: .alert)
    
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alertController.addAction(action)
        
        //before we call the alert we need to save this product in a new order
        let order = Order()
        order.order_id = 1
        order.product = product
        
        
        // 1. pull out what is currently in orders 
        var orders = Orders.readOrdersFromArchive()
        
        // 2. append new order to it 
        orders?.append(order)
        
        // 3. save the new list of orders to disk
        
        if let orders = orders {
            
            // orders is optional so we need to unwrap it
            // if it correctly added to the archives then present the alert 
            if(Orders.saveOrdersToArchive(orders: orders)) {
                present(alertController, animated: true, completion: nil)

            }
        }
        
    }
    
    
    
    


}
