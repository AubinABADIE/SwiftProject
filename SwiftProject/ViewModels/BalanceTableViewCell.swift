//
//  SoldeTableViewCell.swift
//  SwiftProject
//
//  Created by Nathan TRAINEAU on 01/04/2019.
//  Copyright © 2019 Aubin ABADIE & Nathan TRAINEAU. All rights reserved.
//


import UIKit

class BalanceTableViewCell: UITableViewCell {
    
    @IBOutlet weak var participantName: UILabel!
    
    @IBOutlet weak var participantAmount: UILabel!
    
    var name: String
    var montant: String
    
}
