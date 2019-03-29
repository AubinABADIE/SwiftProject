//
//  ExpenseViewController.swift
//  SwiftProject
//
//  Created by Aubin ABADIE on 27/03/2019.
//  Copyright © 2019 Aubin ABADIE & Nathan TRAINEAU. All rights reserved.
//

import UIKit

class ExpenseViewController: UIViewController {

    
    @IBOutlet weak var expenseTableView: UITableView!
    
    var expensesTableViewController: ExpensesTableViewController!
    var fetchedResultController: ExpenseFetchResultController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.expensesTableViewController = ExpensesTableViewController(expenseTableView: expenseTableView, viewController: self)
        self.expensesTableViewController.fetchedResultController = ExpenseFetchResultController(view: expenseTableView)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
