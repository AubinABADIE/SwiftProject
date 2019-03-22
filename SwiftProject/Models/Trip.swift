//
//  Trip.swift
//  SwiftProject
//
//  Created by Aubin ABADIE on 22/03/2019.
//  Copyright © 2019 Aubin ABADIE & Nathan TRAINEAU. All rights reserved.
//

import Foundation
import UIKit

class Trip {
    
    var name: String
    var persons: PersonSet
    var img: UIImage?
    
    init(name: String, persons: PersonSet) {
        self.name = name
        self.persons = persons
    }
}

extension Trip: Equatable{
    static func == (lhs: Trip, rhs: Trip) -> Bool {
        return lhs.name == rhs.name
    }
    
    static func != (lhs: Trip, rhs: Trip) -> Bool {
        return !(lhs == rhs)
    }
}
