//
//  Person.swift
//  SwiftProject
//
//  Created by Aubin ABADIE on 22/03/2019.
//  Copyright © 2019 Aubin ABADIE & Nathan TRAINEAU. All rights reserved.
//

import Foundation

extension Person {
    
    var name: String { return self.pname ?? "" }
    var entryDate: Date? { return self.pentryDate ?? nil }
    var exitDate: Date? { return self.pexitDate ?? nil }
    var expenses: [Expense] { return self.expensesOfPerson?.allObjects as! [Expense]}
    
    var expensePaid: [Expense] { return self.expensesPaid?.allObjects as! [Expense]}
    
    var balanceAmount: Float {
        var amt: Float = 0.0
        for e in self.expenses {
            var persConcerned: [Person] { return e.ePersonConcerned}
            let count = Float(persConcerned.count)
            amt -= e.amount/count
        }
        for e in self.expensePaid {
            amt += e.amount
        }
        return amt
    }
    
    convenience init(name: String){
        self.init(context: CoreDataManager.context)
        self.pname = name
        self.pentryDate = NSDate() as Date
        self.pexitDate = nil
    }
}
