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

    var trips: [Trip] = [Trip(name: "Trip1", persons: PersonSet(persons: [Person(name: "Nom")]))]
    var tripSet: TripSet
    var delegate: TripTableViewModelDelegate?
    
    init(){
        self.tripSet = TripSet()
    }
    
    init(tripSet: TripSet){
        self.tripSet = tripSet
        for trip in self.tripSet {
            trips.append(trip)
        }
    }
    
    func getTripAt(index: Int) -> Trip?{
        if trips.count > index{
            return trips[index]
        }
        else {return nil}
    }
    
    func addTripToSet(trip: Trip){
        self.tripSet.add(trip: trip)
        self.trips.append(trip)
    }
}
