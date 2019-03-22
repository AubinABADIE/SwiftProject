//
//  PersonSet.swift
//  SwiftProject
//
//  Created by Aubin ABADIE on 22/03/2019.
//  Copyright © 2019 Aubin ABADIE & Nathan TRAINEAU. All rights reserved.
//

import Foundation

class PersonSet {
    
    fileprivate var persons = [Person]()
    
    init(persons: [Person]){
        self.persons = persons
    }
    
    func isEmpty() -> Bool{
        return persons.isEmpty
    }
    
    func add(person: Person){
        if(!persons.contains(person)){
            persons.append(person)
        }
    }
    
    func remove(person: Person){
        if let index = self.indexOf(person: person) {
            persons.remove(at: index)
        }
    }
    
    func count() -> Int{
        return persons.count
    }
    
    func contains(person: Person) -> Bool{
        return persons.contains(person)
    }
    
    func look(person: Person)->Person?{
        for p in persons{
            if p == person{
                return p
            }
        }
        return nil
    }
    
    func contains(name: String)-> Bool{
        for person in persons{
            if person.name == name{
                return true
            }
        }
        return false
    }
    
    func look(name: String)->[Person]{
        var tabPers = [Person]()
        for p in persons{
            if p.name == name{
                tabPers.append(p)
            }
        }
        return tabPers
    }
    
    
    func indexOf(person: Person) -> Int? {
        if let index = persons.index(of: person){
            return persons.distance(from: persons.startIndex, to: index)
        }
        return nil
    }
    
    public func makeIterator() -> ItPersonSet {
        return ItPersonSet(self)
    }
}

struct ItPersonSet: IteratorProtocol {
    typealias Element = Person
    
    private var set: PersonSet
    private var curr: Int = 0
    
    fileprivate init(_ set: PersonSet){
        self.set = set
    }
    
    mutating func next() -> Person? {
        curr += 1
        return self.set.persons[curr]
    }
    
    mutating func reset() -> ItPersonSet {
        self.curr = 0
        return self
    }
    
    public var end : Bool {
        return self.curr < self.set.count()
    }
}
