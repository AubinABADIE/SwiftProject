//
//  ViewController.swift
//  SwiftProject
//
//  Created by Aubin ABADIE on 22/03/2019.
//  Copyright © 2019 Aubin ABADIE & Nathan TRAINEAU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tripTableView: UITableView!
    var tripTableViewController: TripTableViewController!
    var fetchedResultController: TripFetchResultController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tripTableViewController = TripTableViewController(tripTableView: tripTableView, viewController: self)
        self.tripTableViewController.fetchedResultController = TripFetchResultController(view: tripTableView)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "TripDetail"{
            let barViewController = segue.destination as! TabViewController
            let cell = sender as! TripTableViewCell
            barViewController.trip = cell.trip
        }
    }
    
    @IBAction func unwindToMainView(sender: UIStoryboardSegue){}
}
