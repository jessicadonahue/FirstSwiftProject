//
//  ProductsTableViewController.swift
//  FirstSwiftProject
//
//  Created by Jessica Donahue on 4/8/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

import UIKit

class ProductsTableViewController: UITableViewController {
    var products: [Product]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //create product object here 
        let product1 = Product()
        let product2 = Product()
        let product3 = Product()
        let product4 = Product()
        
        product1.name = "1907 Wall Set"
        product1.productImage = "phone-fullscreen1"
        product1.cellImage = "image-cell1"
        product1.price = 19.99
        
        product2.name = "1921 Dial Phone"
        product2.productImage = "phone-fullscreen2"
        product2.cellImage = "image-cell2"
        product2.price = 9.99
        
        product3.name = "1937 Desk Set"
        product3.productImage = "phone-fullscreen3"
        product3.cellImage = "image-cell3"
        product3.price = 59.99
        
        product4.name = "1984 Motorola Portable"
        product4.productImage = "phone-fullscreen4"
        product4.cellImage = "image-cell4"
        product4.price = 0.99
        
        products = [product1, product2, product3, product4]
        
    }
    
    // sender is the cell that caused the segue to happen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ShowProduct" {
            
            // adding the question mark to the as returns an optional ProductViewController because it doesnt trust us that this view controller will be a ProductViewController
            
            let productVC = segue.destination as? ProductViewController
            
            // productVC? means only set the name if productVC exists
            // here we are hardcoding the name of the product so every product has the same name -> we dont want this

            // GUARD -> if these things do not exist, then the function will stop running there and then
            // you can safely use the cell and indexPath variables else where
            guard let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) else {
                return
            }
            
            //use the index path to get the product name from the array
            //send the product name to the product view controller
            productVC?.product = products?[indexPath.row]


        }
    }
    
    
    // update this function to return the number of items in the products array
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // if -> checks if productNames exists
            // if productNames exists, it creates a non-optional verson of it called pNames
        if let p = products {
            return p.count
        }
        // if productNames does not exist we have to return 0
        return 0
    }
    
    // update this function to use one of the names in the products array for each cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath)
        
        let product = products?[indexPath.row]
        
        if let p = product {
            cell.textLabel?.text = p.name
            
            // if the product's image exists (unwrapping the optional cellImage)
            if let i = p.cellImage {
                
                cell.imageView?.image = UIImage(named: i)

            }

            
        }
        
        
        return cell
    }
    
}
