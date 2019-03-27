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
    var viewController: UIViewController
    
    init(tripTableView: UITableView, viewController: UIViewController) {
        self.tripTableView = tripTableView
        self.viewController = viewController
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
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let alert = UIAlertController(title: "Suppression d'un voyage", message: "Vous perdrez toutes les données le concernant. Êtes-vous sûr de vouloir continuer ?", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Oui", style: .default, handler: { action in
                CoreDataManager.context.delete(self.fetchedResultController.tripsFetched.object(at: indexPath))
            }))
            alert.addAction(UIAlertAction(title: "Non", style: .cancel, handler: nil))
            
            viewController.present(alert, animated: true)
        }
    }

    
}
