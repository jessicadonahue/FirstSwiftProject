//
//  CartTableViewController.swift
//  FirstSwiftProject
//
//  Created by Jessica Donahue on 4/9/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

import UIKit

class CartTableViewController: UITableViewController {

    var orders: [Order]?
    var totalCost: Double = 0.0
    
    
    // gets called once in the beginning when it loads
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.contentInset = UIEdgeInsets(top: 20,left: 0,bottom: 0,right: 0)
        


    }
    
    // gets called every time the view appears (after viewDidLoad)
    // store a set of things that are in our cart
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        

        
        orders = Orders.readOrdersFromArchive()
        
        guard let orders = orders else {
            return
        }
        
        // total up the item costs
            for object in orders {
                let orderCost = object.product?.price
                
                totalCost = totalCost + orderCost!
            }
        
        
        
        print(totalCost)
        

        
        // we need to refreshes everything in case something was added to cart
        // 1 way to do this
         tableView.reloadData()
        
/*
        // changed from var to let
        let product1 = Product()
        
        product1.name = "1907 Wall Set"
        product1.productImage = "phone-fullscreen1"
        product1.cellImage = "image-cell1"
        product1.price = 19.99
        
        let order = Order()
        order.order_id = 1
        order.product = product1
        
        orders = [order, order, order, order]
        
        //order is optional so we have to unwrap
        if let orders = orders {
            
            // this basically says let nothing equal the result of calling this function
            // this function returns a boolean but we dont need it right now, this thows away the result but calls the function
            print(Orders.saveOrdersToArchive(orders: orders))

        }
 */

        
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath)

        // this is still technically an optional so we have to unwrap it in the next statement 
        let order = orders?[indexPath.row]
        
        cell.textLabel?.text = order?.product?.name
        
        return cell
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            

            // Delete the row from the data source
            orders?.remove(at: indexPath.row)
            
            // then persist that change back to disk 
            if let orders = orders {
                
                Orders.saveOrdersToArchive(orders: orders)

            }
            tableView.deleteRows(at: [indexPath], with: .fade)

            
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


}
