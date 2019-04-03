//
//  AddExpenseViewController.swift
//  SwiftProject
//
//  Created by Nathan TRAINEAU on 29/03/2019.
//  Copyright © 2019 Aubin ABADIE & Nathan TRAINEAU. All rights reserved.
//

import UIKit

class AddExpenseViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource{
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return persons.count
    }
    
     func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return persons[row].name
    }
    
    
    var trip: Trip!
    var expense: Expense?
    var image: UIImage?
    let imagePicker = UIImagePickerController()
    var persons: [Person]!
    var participantTableView: ParticipantsTableViewController?
   
    @IBOutlet weak var expenseParticipantTableView: UITableView!
    
    @IBOutlet weak var expenseTitle: UITextField!
    @IBOutlet weak var expenseAmount: UITextField!
    @IBOutlet weak var expenseDate: UIDatePicker!
    
    @IBOutlet weak var pickerPaidBy: UIPickerView!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var expenseImage: UIImageView!
    
    //@IBOutlet weak var expenseImage: UIImageView!
    
    //@IBOutlet weak var expenseParticipantsTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.expenseTitle.delegate = self
        self.pickerPaidBy.delegate = self
        self.pickerPaidBy.dataSource = self
        self.participantTableView = ParticipantsTableViewController(expenseParticipantTableView: expenseParticipantTableView, viewController: self)
        self.participantTableView!.trip = self.trip!
        updateSaveButtonState()
        self.participantTableView!.fetchedResultController = PersonFetchResultController(view: expenseParticipantTableView, trip: self.trip)
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
            //Problèmeee lààà ?
            //ici parcours le tableau des participants qui ont le switch coché
            for pers in participantTableView!.personsParticpant {
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
    
    
    
    private func updateSaveButtonState() {
        // Disable the Save button if the text field is empty.
        let vexpenseTitle = expenseTitle.text ?? ""
        let vexpenseAmount = expenseAmount.text ?? ""
        saveButton.isEnabled = !vexpenseTitle.isEmpty && !vexpenseAmount.isEmpty
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        updateSaveButtonState()
        navigationItem.title = textField.text
    }
    
    
}
