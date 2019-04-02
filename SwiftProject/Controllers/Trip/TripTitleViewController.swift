//
//  TripTitleViewController.swift
//  SwiftProject
//
//  Created by Aubin ABADIE on 29/03/2019.
//  Copyright © 2019 Aubin ABADIE & Nathan TRAINEAU. All rights reserved.
//

import UIKit

class TripTitleViewController: UIViewController {
    
    var trip: Trip!
    @IBOutlet weak var tripImage: UIImageView!
    @IBOutlet weak var tripName: UILabel!
    @IBOutlet weak var tripPersons: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tripImage.image = trip.image
        self.tripName.text = trip.name
        let persons = trip.personsOfTrip!.allObjects as! [Person]
        var pStr: String = ""
        for p in persons {
            pStr += p.pname! + ", "
        }
        self.tripPersons.text = pStr
    }
}
