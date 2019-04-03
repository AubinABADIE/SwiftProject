//
//  ExpensesTableViewCell.swift
//  SwiftProject
//
//  Created by Nathan TRAINEAU on 29/03/2019.
//  Copyright © 2019 Aubin ABADIE & Nathan TRAINEAU. All rights reserved.
//

import UIKit

class ExpensesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var expenseTitle: UILabel!
    @IBOutlet weak var expenseAmount: UILabel!
    @IBOutlet weak var expenseDate: UILabel!
    @IBOutlet weak var expensePerson: UILabel!
    
    var expense: Expense!
    
}
