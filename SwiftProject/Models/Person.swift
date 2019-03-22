//
//  Person.swift
//  SwiftProject
//
//  Created by Aubin ABADIE on 22/03/2019.
//  Copyright © 2019 Aubin ABADIE & Nathan TRAINEAU. All rights reserved.
//

import Foundation

class Person {
    var name: String
    var balance: Double
    var arriveDate: Date
    var departDate: Date?
    
    init(name: String){
        self.name = name
        self.balance = 0.0
        self.arriveDate = NSDate() as Date
        self.departDate = nil
    }
}

extension Person: Equatable{
    static func == (lhs: Person, rhs: Person) -> Bool {
        return
            lhs.name == rhs.name &&
                rhs.balance == lhs.balance &&
                rhs.arriveDate == lhs.arriveDate
    }
    
    static func != (lhs: Person, rhs: Person) -> Bool {
        return !(lhs == rhs)
    }
}
