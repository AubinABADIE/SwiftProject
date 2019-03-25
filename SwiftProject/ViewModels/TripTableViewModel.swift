//
//  TripTableViewModel.swift
//  SwiftProject
//
//  Created by Aubin ABADIE on 22/03/2019.
//  Copyright © 2019 Aubin ABADIE & Nathan TRAINEAU. All rights reserved.
//

import UIKit
import Foundation

class TripTableViewModel {

    var trips: [Trip] = [Trip(name: "Trip1")]
    
    var delegate: TripTableViewModelDelegate?
    
    init(){

    }
    
    func getTripAt(index: Int) -> Trip?{
        if trips.count > index{
            return trips[index]
        }
        else {return nil}
    }
    
    func addTripToSet(trip: Trip){
    }
}
