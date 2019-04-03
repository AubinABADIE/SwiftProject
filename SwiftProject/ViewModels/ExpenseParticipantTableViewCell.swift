//
//  ExpenseParticipantTableViewCell.swift
//  SwiftProject
//
//  Created by nathan on 02/04/2019.
//  Copyright © 2019 Aubin ABADIE & Nathan TRAINEAU. All rights reserved.
//

import Foundation
import UIKit

class ExpenseParticipantTableViewCell: UITableViewCell {
    
    @IBOutlet weak var participantSwitch: UISwitch!
    @IBOutlet weak var participantName: UILabel!
    
    var person: Person!
}
