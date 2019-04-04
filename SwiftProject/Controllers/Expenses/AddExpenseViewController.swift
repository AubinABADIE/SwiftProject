//
//  AddExpenseViewController.swift
//  SwiftProject
//
//  Created by Nathan TRAINEAU on 29/03/2019.
//  Copyright © 2019 Aubin ABADIE & Nathan TRAINEAU. All rights reserved.
//

import UIKit

class AddExpenseViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDelegate, UITableViewDataSource {
    
    var trip: Trip!
    var expense: Expense?
    var image: UIImage?
    let imagePicker = UIImagePickerController()
    var persons: [Person]!
    
    var personsParticipant: [Person] = []
   
    @IBOutlet weak var expenseParticipantTableView: UITableView!
    
    @IBOutlet weak var expenseTitle: UITextField!
    @IBOutlet weak var expenseAmount: UITextField!
    @IBOutlet weak var expenseDate: UIDatePicker!
    @IBOutlet weak var pickerPaidBy: UIPickerView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var expenseImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.expenseTitle.delegate = self
        self.pickerPaidBy.delegate = self
        self.pickerPaidBy.dataSource = self
        self.imagePicker.delegate = self
        self.expenseParticipantTableView.dataSource = self
        self.expenseParticipantTableView.delegate = self
        updateSaveButtonState()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return persons.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return persons[row].name
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "DoneAddExpense"{
            let name: String = expenseTitle.text!
            let amount: Float = Float(expenseAmount.text!) as! Float
            let ddate: Date = expenseDate.date
            let paidBy: Person = persons[pickerPaidBy.selectedRow(inComponent: 0)]
            if let image = expenseImage.image {
                self.expense = Expense(title: name, image: image, amount: amount, isTransfer: false, date: ddate)
            } else {
                self.expense = Expense(title: name, date: ddate, amount: amount, isTransfer: false)
            }
            for pers in self.personsParticipant {
                self.expense!.addToPersonsConcerned(pers)
            }
            self.expense!.tripConcerned = self.trip
            self.expense!.personWhoPaid = paidBy
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text{
            if text != ""{
                textField.resignFirstResponder()
                return true
            }
        }
        return false
    }
    
    private func updateSaveButtonState() {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        updateSaveButtonState()
        navigationItem.title = textField.text
    }
    
    @IBAction func pickImage(_ sender: Any) {
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        self.image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage?
        self.expenseImage.image = image
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    // *********** PARTICIPANT TABLEVIEW ******************
    
    @IBAction func switched(_ sender: Any) {
        let cell = (sender as! UISwitch).superview?.superview
            as! ExpenseParticipantTableViewCell
        print(cell.person.name)
        if personsParticipant.contains(cell.person) {
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
