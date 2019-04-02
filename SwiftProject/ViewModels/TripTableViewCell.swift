//
//  TripTableViewCell.swift
//  SwiftProject
//
//  Created by Aubin ABADIE on 22/03/2019.
//  Copyright © 2019 Aubin ABADIE & Nathan TRAINEAU. All rights reserved.
//

import UIKit

class TripTableViewCell: UITableViewCell {

    @IBOutlet weak var tripName: UILabel!
    @IBOutlet var tripImage: UIImageView!
    @IBOutlet weak var tripAmount: UILabel!
    
    var trip: Trip!
 
}
