//
//  ParticipantsTableViewController.swift
//  SwiftProject
//
//  Created by nathan on 02/04/2019.
//  Copyright © 2019 Aubin ABADIE & Nathan TRAINEAU. All rights reserved.
//

import Foundation
import UIKit

// *********** PERSON TABLEVIEW ******************

class ParticipantsTableViewController:  NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var expenseParticipantTableView: UITableView!
    var trip: Trip!
    var fetchedResultController: PersonFetchResultController!
    var viewController: UIViewController
    //var personsParticpant: [Person]!
    
    init(expenseParticipantTableView: UITableView, viewController: UIViewController){
    // Do any additional setup after loading the view.
    self.viewController = viewController
    self.expenseParticipantTableView = expenseParticipantTableView
    super.init()
    self.expenseParticipantTableView.dataSource = self
    self.expenseParticipantTableView.delegate = self
}

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let section = self.fetchedResultController.personsFetched.sections?[section] else {
        fatalError()
    }
    return section.numberOfObjects
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = expenseParticipantTableView.dequeueReusableCell(withIdentifier: "ParticipantCell", for: indexPath) as? ExpenseParticipantTableViewCell else {
        fatalError("The dequeued cell is not an instance of ExpenseParticipantTableViewCell.")
    }
    return self.configure(cell: cell, atIndexPath: indexPath)
}

func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
        let alert = UIAlertController(title: "Suppression d'un voyage", message: "Vous perdrez toutes les données le concernant. Êtes-vous sûr de vouloir continuer ?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Oui", style: .default, handler: { action in
            CoreDataManager.context.delete(self.fetchedResultController.personsFetched.object(at: indexPath))
        }))
        alert.addAction(UIAlertAction(title: "Non", style: .cancel, handler: nil))
        
        viewController.present(alert, animated: true)
    }
}

private func configure(cell: ExpenseParticipantTableViewCell, atIndexPath indexPath: IndexPath) -> UITableViewCell {
    let participants = self.fetchedResultController.personsFetched.object(at: indexPath)
    cell.person = participants
    cell.participantName.text = participants.name
    return cell
}
}
