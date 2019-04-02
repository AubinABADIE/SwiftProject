//
//  BalanceSoldeTableViewController.swift
//  SwiftProject
//
//  Created by Nathan TRAINEAU on 01/04/2019.
//  Copyright © 2019 Aubin ABADIE & Nathan TRAINEAU. All rights reserved.
//

import Foundation


import UIKit

class BalanceTableViewController: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    var balanceTableView: UITableView!
    var fetchedResultController: ExpenseFetchResultController!
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
        guard let section = self.fetchedResultController.soldeFetched.sections?[section] else {
            fatalError()
        }
        return section.numberOfObjects
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = balanceTableView.dequeueReusableCell(withIdentifier: "ExpenseCell", for: indexPath) as? balanceTableViewCell else {
            fatalError("The dequeued cell is not an instance of ExpenseTableViewCell.")
        }
        return self.configure(cell: cell, atIndexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let alert = UIAlertController(title: "Suppression d'une dépense", message: "Vous perdrez toutes les données le concernant. Êtes-vous sûr de vouloir continuer ?", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Oui", style: .default, handler: { action in CoreDataManager.context.delete(self.fetchedResultController.soldeFetched.object(at: indexPath))
            }))
            alert.addAction(UIAlertAction(title: "Non", style: .cancel, handler: nil))
            
            viewController.present(alert, animated: true)
        }
    }
    
    private func configure(cell: BalanceTableViewCell, atIndexPath indexPath: IndexPath) -> UITableViewCell {
        let solde = self.fetchedResultController.balanceFetched.object(at: indexPath)
        cell.name = solde.title
        //cell.montant = solde.montant il faut pouvoir créer un solde avec le montant selon la personne en paramètre
        return cell
    }
}
