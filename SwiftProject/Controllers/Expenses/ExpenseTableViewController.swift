//
//  ExpenseTableViewController.swift
//  SwiftProject
//
//  Created by Nathan TRAINEAU on 29/03/2019.
//  Copyright © 2019 Aubin ABADIE & Nathan TRAINEAU. All rights reserved.
//

import UIKit

class ExpenseTableViewController: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    var expenseTableView: UITableView!
    var fetchedResultController: ExpenseFetchResultController!
    var viewController: UIViewController
    
    init(expenseTableView: UITableView, viewController: UIViewController) {
        self.expenseTableView = expenseTableView
        self.viewController = viewController
        super.init()
        self.expenseTableView.dataSource = self
        self.expenseTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = self.fetchedResultController.expensesFetched.sections?[section] else {
            fatalError()
        }
        return section.numberOfObjects
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = expenseTableView.dequeueReusableCell(withIdentifier: "ExpenseCell", for: indexPath) as? ExpensesTableViewCell else {
            fatalError("The dequeued cell is not an instance of ExpenseTableViewCell.")
        }
        return self.configure(cell: cell, atIndexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let alert = UIAlertController(title: "Suppression d'une dépense", message: "Vous perdrez toutes les données le concernant. Êtes-vous sûr de vouloir continuer ?", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Oui", style: .default, handler: { action in CoreDataManager.context.delete(self.fetchedResultController.expensesFetched.object(at: indexPath))
            }))
            alert.addAction(UIAlertAction(title: "Non", style: .cancel, handler: nil))
            
            viewController.present(alert, animated: true)
        }
    }
    
    private func configure(cell: ExpensesTableViewCell, atIndexPath indexPath: IndexPath) -> UITableViewCell {
        let expense = self.fetchedResultController.expensesFetched.object(at: indexPath)
        cell.expense = expense
        cell.expenseTitle.text = expense.title
        return cell
    }
}
