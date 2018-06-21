//
//  MyTableViewController.swift
//  Test1
//
//  Created by D7702_10 on 2018. 6. 21..
//  Copyright © 2018년 ksh. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController {
    
    var foodStoreName = ["늘해랑", "번개반점"]
    var foodStoreAddress = ["부산광역시 부산진구 양정1동 350-1", "부산광역시 부산진구 양정동 418-282"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return foodStoreName.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RE", for: indexPath) as! MyTableViewCell
        
        cell.name.text = foodStoreName[indexPath.row]
        cell.address.text = foodStoreAddress[indexPath.row]


        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mapview"{
            if let indexPath = tableView.indexPathForSelectedRow{
                let destinationController = segue.destination as! MapViewController
                destinationController.name = foodStoreName[indexPath.row]
                destinationController.address = foodStoreAddress[indexPath.row]
            }
        } else if segue.identifier == "totalMap"{
            let destinationController = segue.destination as! TotalViewController
            destinationController.name = foodStoreName
            destinationController.address = foodStoreAddress
        }
    }
    

}
