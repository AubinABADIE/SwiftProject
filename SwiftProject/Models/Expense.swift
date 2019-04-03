//
//  Expense.swift
//  SwiftProject
//
//  Created by Nathan TRAINEAU on 29/03/2019.
//  Copyright © 2019 Aubin ABADIE & Nathan TRAINEAU. All rights reserved.
//

import Foundation
import UIKit

extension Expense {
    
    var title: String { return self.titleexpense ?? "" }
    var date: Date? { return self.dateexpense ?? nil }
    var isTransfer: Bool { return self.transferexpense }
    var amount: Float { return self.amountexpense }
    var image: UIImage { return UIImage(data: self.imageexpense!) ?? UIImage(named: "DefaultImg")! }
    
    var eTrip: Trip { return self.tripConcerned! as Trip }
    var ePerson: Person { return self.personWhoPaid! as Person }
    var ePersonConcerned : [Person] { return self.personsConcerned?.allObjects as! [Person] }
    
    
    convenience init(title: String, date: Date, amount: Float, isTransfer: Bool) {
        self.init(context: CoreDataManager.context)
        self.titleexpense = title
        self.amountexpense = amount
        self.dateexpense = NSDate() as Date
        self.transferexpense = isTransfer
        self.imageexpense = UIImage(named: "DefaultImg")?.jpegData(compressionQuality: 0.8)
    }
    
    convenience init(title: String, image: UIImage?, amount: Float, isTransfer: Bool, date: Date) {
        self.init(context: CoreDataManager.context)
        self.titleexpense = title
        self.imageexpense = image?.jpegData(compressionQuality: 0.8)
        self.amountexpense = amount
        self.dateexpense = date
        self.transferexpense = isTransfer
    }
}
