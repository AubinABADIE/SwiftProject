//
//  BalanceTableViewController.swift
//  SwiftProject
//
//  Created by nathan on 02/04/2019.
//  Copyright © 2019 Aubin ABADIE & Nathan TRAINEAU. All rights reserved.
//

import Foundation
import UIKit

class BalanceTableViewController: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    var balanceTableView: UITableView!
    var fetchedResultController: PersonFetchResultController!
    var viewController: UIViewController
    
    var trip: Trip!
    var person: Person!
    
    init(balanceTableView: UITableView, viewController: UIViewController) {
        self.balanceTableView = balanceTableView
        self.viewController = viewController
        super.init()
        self.balanceTableView.dataSource = self
        self.balanceTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = self.fetchedResultController.personsFetched.sections?[section] else {
            fatalError()
        }
        return section.numberOfObjects
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = balanceTableView.dequeueReusableCell(withIdentifier: "BalanceCell", for: indexPath) as? BalanceTableViewCell else {
            fatalError("The dequeued cell is not an instance of ExpenseTableViewCell.")
        }
        return self.configure(cell: cell, atIndexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let alert = UIAlertController(title: "Suppression d'une dépense", message: "Vous perdrez toutes les données le concernant. Êtes-vous sûr de vouloir continuer ?", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Oui", style: .default, handler: { action in CoreDataManager.context.delete(self.fetchedResultController.personsFetched.object(at: indexPath))
            }))
            alert.addAction(UIAlertAction(title: "Non", style: .cancel, handler: nil))
            
            viewController.present(alert, animated: true)
        }
    }
    
    private func configure(cell: BalanceTableViewCell, atIndexPath indexPath: IndexPath) -> UITableViewCell {
        let persons = self.fetchedResultController.personsFetched.object(at: indexPath)
        cell.participantName.text = persons.name
        cell.participantAmount.text = String(persons.balanceAmount)
        //cell.montant = solde.montant il faut pouvoir créer un solde avec le montant selon la personne en paramètre
        return cell
    }
}
