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
    var viewController: UIViewController
    
    var trip: Trip!
    
    init(expenseTableView: UITableView, viewController: UIViewController) {
        self.expenseTableView = expenseTableView
        self.viewController = viewController
        super.init()
        self.expenseTableView.dataSource = self
        self.expenseTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.trip.lExpenses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = expenseTableView.dequeueReusableCell(withIdentifier: "ExpenseCell", for: indexPath) as? ExpensesTableViewCell else {
            fatalError("The dequeued cell is not an instance of ExpenseTableViewCell.")
        }
        return self.configure(cell: cell, atIndexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let alert = UIAlertController(title: "Suppression d'une dépense", message: "Vous perdrez toutes les données la concernant. Êtes-vous sûr de vouloir continuer ?", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Oui", style: .default, handler: { action in
                CoreDataManager.context.delete(self.trip.lExpenses[indexPath.row])
            }))
            alert.addAction(UIAlertAction(title: "Non", style: .cancel, handler: nil))
            
            viewController.present(alert, animated: true)
        }
    }
    
    private func configure(cell: ExpensesTableViewCell, atIndexPath indexPath: IndexPath) -> UITableViewCell {
        let expense = self.trip.lExpenses[indexPath.row]
        cell.expense = expense
        cell.expenseTitle.text = expense.title
        cell.expenseAmount.text = String(expense.amount) + "€"
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        let paymentDate = formatter.string(from: expense.dateexpense!)
        cell.expenseDate.text = paymentDate
        cell.expensePerson.text = expense.ePerson.name
        return cell
    }
}
