//
//  ExpenseViewController.swift
//  SwiftProject
//
//  Created by Aubin ABADIE on 27/03/2019.
//  Copyright © 2019 Aubin ABADIE & Nathan TRAINEAU. All rights reserved.
//

import UIKit

class ExpenseViewController: UIViewController {
    
    var trip: Trip!
    
    @IBOutlet weak var expenseTableView: UITableView!
    var expenseTableViewController: ExpenseTableViewController!
    var fetchedResultController: ExpenseFetchResultController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.expenseTableViewController = ExpenseTableViewController(expenseTableView: expenseTableView, viewController: self)
        self.expenseTableViewController.fetchedResultController = ExpenseFetchResultController(view: expenseTableView, trip: self.trip!)
        self.expenseTableViewController.trip = self.trip
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TitleBarInfo"{
            let dest = segue.destination as! TripTitleViewController
            dest.trip = self.trip
        } else if (segue.identifier == "AddExpense") {
            let nextVC = segue.destination as! AddExpenseViewController
            nextVC.trip = self.trip
        }
    }
    
    @IBAction func unwindToExpenseView(sender: UIStoryboardSegue){}
}
