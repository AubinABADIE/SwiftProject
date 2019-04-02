//
//  TabViewController.swift
//  SwiftProject
//
//  Created by Aubin ABADIE on 27/03/2019.
//  Copyright © 2019 Aubin ABADIE & Nathan TRAINEAU. All rights reserved.
//

import UIKit

class TabViewController: UITabBarController {

    var trip: Trip!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.viewControllers?.forEach {
            if let vc = $0 as? BalanceViewController {
                vc.trip = self.trip
            } else if let vc = $0 as? ExpenseViewController {
                vc.trip = self.trip
            }
        }
    }
}
