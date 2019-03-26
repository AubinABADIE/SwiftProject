//
//  Trip.swift
//  SwiftProject
//
//  Created by Aubin ABADIE on 22/03/2019.
//  Copyright © 2019 Aubin ABADIE & Nathan TRAINEAU. All rights reserved.
//

import Foundation
import UIKit

extension Trip {
    
    public var name: String { return self.tname ?? "" }
    var image: UIImage { return UIImage(data: self.timage!) ?? UIImage(named: "DefaultImg")! }
    
    convenience init(name: String) {
        self.init(context: CoreDataManager.context)
        self.tname = name
        self.timage = UIImage(named: "DefaultImg")?.jpegData(compressionQuality: 0.8)
    }
    
    convenience init(name: String, image: UIImage) {
        self.init(context: CoreDataManager.context)
        self.tname = name
        self.timage = image.jpegData(compressionQuality: 0.8)
    }
}
