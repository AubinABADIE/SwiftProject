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
    
    convenience init(name: String){
        self.init(context: CoreDataManager.context)
        self.pname = name
        self.pentryDate = NSDate() as Date
        self.pexitDate = nil
    }
}
