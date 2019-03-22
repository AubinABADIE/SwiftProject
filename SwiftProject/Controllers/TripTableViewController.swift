//
//  TripTableViewController.swift
//  SwiftProject
//
//  Created by Aubin ABADIE on 22/03/2019.
//  Copyright © 2019 Aubin ABADIE & Nathan TRAINEAU. All rights reserved.
//

import UIKit

class TripTableViewController: NSObject, UITableViewDataSource, TripTableViewModelDelegate {
    
    @IBOutlet weak var tripTableView: UITableView!
    
    var trips: TripTableViewModel
    
    override init() {
        self.trips = TripTableViewModel()
        super.init()
        self.trips.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trips.trips.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tripTableView.dequeueReusableCell(withIdentifier: "TripCell", for: indexPath) as? TripTableViewCell else {
            fatalError("The dequeued cell is not an instance of TripTableViewCell.")
            
        }
        //cell.name.text = persons.getPersonAt(index: indexPath.row)?.fullname ?? "arg"
        return cell
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func tripAdded(at index: Int) {
        self.tripTableView.beginUpdates()
        self.tripTableView.insertRows(at: [IndexPath(row: index, section: 0)], with: .fade)
        self.tripTableView.endUpdates()
    }
    
}
