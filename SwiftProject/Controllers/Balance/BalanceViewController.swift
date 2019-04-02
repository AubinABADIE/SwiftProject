//
//  BalanceViewController.swift
//  SwiftProject
//
//  Created by Aubin ABADIE on 27/03/2019.
//  Copyright © 2019 Aubin ABADIE & Nathan TRAINEAU. All rights reserved.
//

import UIKit

class BalanceViewController: UIViewController {

    var trip: Trip!
    
    @IBOutlet weak var BalanceTableView: UITableView!
    
    var balanceTableViewController: BalanceTableViewController!
    var fetchedResultController: PersonFetchResultController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.balanceTableViewController = BalanceTableViewController(balanceTableView: BalanceTableView, viewController: self)
        self.balanceTableViewController.fetchedResultController = PersonFetchResultController(view: BalanceTableView, trip: self.trip)
        self.balanceTableViewController.trip = self.trip
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TitleBarInfo"{
            let dest = segue.destination as! TripTitleViewController
            dest.trip = self.trip
        } else if (segue.identifier == "UpdateTrip") {
            let nextVC = segue.destination as! UpdateTripViewController
            nextVC.trip = self.trip
        }
    }
    
    @IBAction func unwindToBalanceView(sender: UIStoryboardSegue){}
}
