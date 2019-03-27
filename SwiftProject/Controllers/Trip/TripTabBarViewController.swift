//
//  TripTabBarViewController.swift
//  SwiftProject
//
//  Created by Aubin ABADIE on 27/03/2019.
//  Copyright © 2019 Aubin ABADIE & Nathan TRAINEAU. All rights reserved.
//

import UIKit

class TripTabBarViewController: UITabBarController {
    
    var trip: Trip = Trip()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        /*self.viewControllers?.forEach {
            if let vc = $0 as? YourViewController {
                vc.trip = self.trip
            }
        }*/
    }

}
