//
//  TripTableViewController.swift
//  SwiftProject
//
//  Created by Aubin ABADIE on 22/03/2019.
//  Copyright © 2019 Aubin ABADIE & Nathan TRAINEAU. All rights reserved.
//

import UIKit

class TripTableViewController: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var tripTableView: UITableView!
    var fetchedResultController: TripFetchResultController!
    
    init(tripTableView: UITableView) {
        self.tripTableView = tripTableView
        super.init()
        self.tripTableView.dataSource = self
        self.tripTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = self.fetchedResultController.tripsFetched.sections?[section] else {
            fatalError()
        }
        return section.numberOfObjects
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tripTableView.dequeueReusableCell(withIdentifier: "TripCell", for: indexPath) as? TripTableViewCell else {
            fatalError("The dequeued cell is not an instance of TripTableViewCell.")
        }
        let trip = self.fetchedResultController.tripsFetched.object(at: indexPath)
        cell.setTripCell(tripName: trip.name, tripImage: trip.image)
        return cell
    }
}
