//
//  ParticipantsTableViewController.swift
//  SwiftProject
//
//  Created by nathan on 02/04/2019.
//  Copyright © 2019 Aubin ABADIE & Nathan TRAINEAU. All rights reserved.
//

import Foundation
import UIKit

// *********** PERSON TABLEVIEW ******************

class ParticipantsTableViewController: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var expenseParticipantTableView: UITableView!
    var trip: Trip!
    var viewController: UIViewController!
    var personsParticipant: [Person] = []
    
    override init() {
        super.init()
    }
    
    init(expenseParticipantTableView: UITableView, viewController: UIViewController){
        // Do any additional setup after loading the view.
        self.viewController = viewController
        self.expenseParticipantTableView = expenseParticipantTableView
        super.init()
        self.expenseParticipantTableView.dataSource = self
        self.expenseParticipantTableView.delegate = self
    }
    
    @IBAction func switched(_ sender: Any) {
        //quand un switch est bougé il récupère la cell correspondant et donc la personne afin de l'ajouter ou la retirer (si elle est deja dans la liste auquel cas l'user aura unchecked le swift)
        let cell = (sender as! UISwitch).superview?.superview
            as! ExpenseParticipantTableViewCell
        let contains = personsParticipant.contains(cell.person)
        if( contains ){
            let index = personsParticipant.index(of: cell.person)!
            personsParticipant.remove(at : index )
        }
        else {
            personsParticipant.append(cell.person)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.trip.lPersons.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = expenseParticipantTableView.dequeueReusableCell(withIdentifier: "ParticipantCell", for: indexPath) as? ExpenseParticipantTableViewCell else {
            fatalError("The dequeued cell is not an instance of ExpenseParticipantTableViewCell.")
        }
        return self.configure(cell: cell, atIndexPath: indexPath)
    }

    private func configure(cell: ExpenseParticipantTableViewCell, atIndexPath indexPath: IndexPath) -> UITableViewCell {
        let participants = self.trip.lPersons[indexPath.row]
        cell.person = participants
        cell.participantName.text = participants.name
        return cell
    }
}
