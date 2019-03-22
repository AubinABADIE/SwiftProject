//
//  TripSet.swift
//  SwiftProject
//
//  Created by Aubin ABADIE on 22/03/2019.
//  Copyright © 2019 Aubin ABADIE & Nathan TRAINEAU. All rights reserved.
//

import Foundation

class TripSet: Sequence {
    
    fileprivate var trips = [Trip]()
    
    init(){}
    
    init(trips: [Trip]){
        self.trips = trips
    }
    
    func isEmpty() -> Bool{
        return trips.isEmpty
    }
    
    func add(trip: Trip){
        if(!trips.contains(trip)){
            trips.append(trip)
        }
    }
    
    func remove(trip: Trip){
        if let index = self.indexOf(trip: trip) {
            trips.remove(at: index)
        }
    }
    
    func count() -> Int{
        return trips.count
    }
    
    func contains(trip: Trip) -> Bool{
        return trips.contains(trip)
    }
    
    func look(trip: Trip) -> Trip?{
        for p in trips{
            if p == trip{
                return p
            }
        }
        return nil
    }
    
    func contains(name: String) -> Bool{
        for trip in trips{
            if trip.name == name{
                return true
            }
        }
        return false
    }
    
    func look(name: String) -> [Trip]{
        var tabPers = [Trip]()
        for p in trips{
            if p.name == name{
                tabPers.append(p)
            }
        }
        return tabPers
    }
    
    
    func indexOf(trip: Trip) -> Int? {
        if let index = trips.index(of: trip){
            return trips.distance(from: trips.startIndex, to: index)
        }
        return nil
    }
    
    public func makeIterator() -> ItTripSet {
        return ItTripSet(self)
    }
}

struct ItTripSet: IteratorProtocol {
    typealias Element = Trip
    
    private var set: TripSet
    private var curr: Int = 0
    
    fileprivate init(_ set: TripSet){
        self.set = set
    }
    
    mutating func next() -> Trip? {
        curr += 1
        return self.set.trips[curr]
    }
    
    mutating func reset() -> ItTripSet {
        self.curr = 0
        return self
    }
    
    public var end : Bool {
        return self.curr < self.set.count()
    }
}

