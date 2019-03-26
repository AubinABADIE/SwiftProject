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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tripTableViewController = TripTableViewController(tripTableView: tripTableView)
        self.tripTableViewController.fetchedResultController = TripFetchResultController(view: tripTableView)
        
    }
    
    @IBAction func unwindToMainView(sender: UIStoryboardSegue){}
}
