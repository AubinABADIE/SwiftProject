//
//  Trip.swift
//  SwiftProject
//
//  Created by Aubin ABADIE on 22/03/2019.
//  Copyright © 2019 Aubin ABADIE & Nathan TRAINEAU. All rights reserved.
//

import Foundation

extension Trip {
    
    public var tName: String { return self.name ?? "" }
    //public var persons: [Person] { return self.persons ?? [] }
    //var tImage: Binary { return self.image ?? nil }
    
    convenience init(name: String) {
        self.init(context: CoreDataManager.context)
        self.name = name
    }
}
