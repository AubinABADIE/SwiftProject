//
//  TripDAO.swift
//  SwiftProject
//
//  Created by Aubin ABADIE on 22/03/2019.
//  Copyright © 2019 Aubin ABADIE & Nathan TRAINEAU. All rights reserved.
//

import Foundation
import CoreData

class TripDAO {
    
    static let request : NSFetchRequest<Trip> = Trip.fetchRequest()
    
    static func save(){
        CoreDataManager.save()
    }
    
    static func delete(trip: Trip){
        CoreDataManager.context.delete(trip)
    }
    
    static func fetchAll() -> [Trip]? {
        self.request.predicate = nil
        do {
            return try CoreDataManager.context.fetch(self.request)
        }
        catch {
            return nil
        }
    }
    
    /// number of elements
    static var count: Int{
        self.request.predicate = nil
        do {
            return try CoreDataManager.context.count(for: self.request)
        }
        catch let error as NSError {
            fatalError(error.description)
        }
    }
    
    static func count(forNname name: String) -> Int{
        self.request.predicate = NSPredicate(format: "name == %@", name)
        do{
            return try CoreDataManager.context.count(for: self.request)
        }
        catch let error as NSError{
            fatalError(error.description)
        }
    }
    
    static func search(forName name: String) -> [Trip]?{
        self.request.predicate = NSPredicate(format: "name == %@", name)
        do{
            return try CoreDataManager.context.fetch(request) as [Trip]
        }
        catch{
            return nil
        }
    }
    
//    static func count (forLastname lastname: String) -> Int{
//        self.request.predicate = NSPredicate(format: "lastname == %@", lastname)
//        do{
//            return try CoreDataManager.context.count(for: self.request)
//        }
//        catch let error as NSError{
//            fatalError(error.description)
//        }
//    }
//
//    static func search(forLastname lastname: String) -> [Person]?{
//        self.request.predicate = NSPredicate(format: "lastname == %@", lastname)
//        do{
//            return try CoreDataManager.context.fetch(request) as [Person]
//        }
//        catch{
//            return nil
//        }
//    }
//
//    static func count(forFirstname firstname: String, lastname: String) -> Int{
//        self.request.predicate = NSPredicate(format: "firstname == %@ AND lastname == %@", firstname, lastname)
//        do{
//            return try CoreDataManager.context.count(for: self.request)
//        }
//        catch let error as NSError{
//            fatalError(error.description)
//        }
//    }
//
//    static func search(forFirstname firstname: String, lastname: String) -> [Person]?{
//        self.request.predicate = NSPredicate(format: "firstname == %@ AND lastname == %@", firstname, lastname)
//        do{
//            return try CoreDataManager.context.fetch(request) as [Person]
//        }
//        catch{
//            return nil
//        }
//    }
//
//    static func count(forFirstname firstname: String, lastname: String,  birthdate: Date?) -> Int{
//        if let birthdate = birthdate{
//            self.request.predicate = NSPredicate(format: "firstname == %@ AND lastname == %@ AND birthdate == %@",
//                                                 firstname, lastname, birthdate as CVarArg)
//        } else{
//            self.request.predicate = NSPredicate(format: "firstname == %@ AND lastname == %@ AND birthdate = nil",
//                                                 firstname, lastname)
//        } do {
//            return try CoreDataManager.context.count(for: self.request)
//        }
//        catch let error as NSError{
//            fatalError(error.description)
//        }
//    }
//
//    static func search(forFirstname firstname: String, lastname: String,  birthdate: Date?) -> Person?{
//        if let birthdate = birthdate{
//            self.request.predicate = NSPredicate(format: "firstname == %@ AND lastname == %@ AND birthdate == %@",
//                                                 firstname, lastname, birthdate as CVarArg)
//        } else {
//            self.request.predicate = NSPredicate(format: "firstname == %@ AND lastname == %@ AND birthdate = nil",
//                                                 firstname, lastname)
//        } do {
//        } catch {
//            return nil
//        }
//    }
    
    static func count(trip: Trip) -> Int{
        self.request.predicate = NSPredicate(format: "name == %@", trip.name!)
        do {
            return try CoreDataManager.context.count(for: self.request)
        }
        catch let error as NSError{
            fatalError(error.description)
        }
    }
    
    static func search(forPerson trip: Trip) -> Trip?{
        self.request.predicate = NSPredicate(format: "name == %@", trip.name!)
        do {
            let result = try CoreDataManager.context.fetch(request) as [Trip]
            guard result.count != 0 else { return nil }
            guard result.count == 1 else { fatalError("duplicate entries") }
            return result[0]
        } catch {
            return nil
        }
    }
}
