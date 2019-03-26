//
//  PersonTableViewController.swift
//  SwiftProject
//
//  Created by Aubin ABADIE on 26/03/2019.
//  Copyright © 2019 Aubin ABADIE & Nathan TRAINEAU. All rights reserved.
//

import UIKit

class PersonTableViewController: NSObject, UITableViewDataSource, UITableViewDelegate/*, UITextFieldDelegate */{
    
    var personTableView: UITableView!
    
    var persons: [Person] = []
    
    @IBOutlet weak var personName: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    init(personTableView: UITableView) {
        self.personTableView = personTableView
        super.init()
        self.personTableView.dataSource = self
        self.personTableView.delegate = self
        //self.personName.delegate = self
    }
    
    @IBAction func addPerson(_ sender: Any) {
        self.persons.append(Person(name: personName.text!))
        self.personTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = personTableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath) as? PersonTableViewCell else {
            fatalError("The dequeued cell is not an instance of PersonTableViewCell.")
        }
        let person = persons[indexPath.row]
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        let entryDate = formatter.string(from: person.pentryDate!)
        let exitDate = formatter.string(from: person.pexitDate!)
        
        cell.setPersonCell(name: person.pname!, entry: entryDate, exit: exitDate)
        return cell
    }
    
}
