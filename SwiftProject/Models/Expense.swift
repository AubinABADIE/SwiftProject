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
    var transfer: Bool { return self.transferexpense ?? false }
    var amount: Float { return self.amountexpense ?? 0.0 }
    var image: UIImage { return UIImage(data: self.imageexpense!) ?? UIImage(named: "DefaultImg")! }
    
    var eTrip: Trip { return self.tripConcerned! as Trip }
    
    convenience init(title: String) {
        self.init(context: CoreDataManager.context)
        self.titleexpense = title
        self.imageexpense = UIImage(named: "DefaultImg")?.jpegData(compressionQuality: 0.8)
        
    }
    
    convenience init(title: String, image: UIImage) {
        self.init(context: CoreDataManager.context)
        self.titleexpense = title
        self.imageexpense = image.jpegData(compressionQuality: 0.8)
    }
    
    convenience init(title: String, image: UIImage, amount: Float) {
        self.init(context: CoreDataManager.context)
        self.titleexpense = title
        self.imageexpense = image.jpegData(compressionQuality: 0.8)
        self.amountexpense = amount
    }
    
    convenience init(title: String, image: UIImage, amount: Float, date: Date) {
        self.init(context: CoreDataManager.context)
        self.titleexpense = title
        self.imageexpense = image.jpegData(compressionQuality: 0.8)
        self.amountexpense = amount
        self.dateexpense = date
    }
    
    convenience init(title: String, image: UIImage?, amount: Float, date: Date, transfer: Bool) {
        self.init(context: CoreDataManager.context)
        self.titleexpense = title
        self.imageexpense = image?.jpegData(compressionQuality: 0.8)
        self.amountexpense = amount
        self.dateexpense = date
        self.transferexpense = transfer
    }
}
