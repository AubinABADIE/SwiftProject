//
//  TripTitleViewController.swift
//  SwiftProject
//
//  Created by Aubin ABADIE on 29/03/2019.
//  Copyright © 2019 Aubin ABADIE & Nathan TRAINEAU. All rights reserved.
//

import UIKit

class TripTitleViewController: UIViewController {
    
    var trip: Trip?
    @IBOutlet weak var tripImage: UIImageView!
    @IBOutlet weak var tripName: UILabel!
    @IBOutlet weak var tripPersons: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tripImage.image = trip?.image
        self.tripName.text = trip?.name
        let persons: String = "Entré, à la, main, à régler"
        self.tripPersons.text = persons
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
