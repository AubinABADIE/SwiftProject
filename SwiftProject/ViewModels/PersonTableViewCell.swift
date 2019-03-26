//
//  PersonTableViewCell.swift
//  SwiftProject
//
//  Created by Aubin ABADIE on 26/03/2019.
//  Copyright © 2019 Aubin ABADIE & Nathan TRAINEAU. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
   
    @IBOutlet weak var personName: UILabel!
    @IBOutlet weak var entryDate: UILabel!
    @IBOutlet weak var exitDate: UILabel!
    
    func setPersonCell(name: String, entry: String, exit: String) {
        self.personName.text = name
        self.entryDate.text = entry
        self.exitDate.text = exit
    }
}
