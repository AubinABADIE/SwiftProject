//
//  AddExpenseViewController.swift
//  SwiftProject
//
//  Created by Nathan TRAINEAU on 29/03/2019.
//  Copyright © 2019 Aubin ABADIE & Nathan TRAINEAU. All rights reserved.
//

import UIKit

class AddExpenseViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate {
    
    var trip: Trip!
    var expense: Expense?
    var image: UIImage?
    let imagePicker = UIImagePickerController()
    
    @IBOutlet weak var expenseTitle: UITextField!
    @IBOutlet weak var expenseAmount: UITextField!
    @IBOutlet weak var expenseDate: UIDatePicker!
    @IBOutlet weak var expensePaidBy: UIPickerView!
    
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    //@IBOutlet weak var expenseImage: UIImageView!
    
    //@IBOutlet weak var expenseParticipantsTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.expenseTitle.delegate = self
        updateSaveButtonState()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "DoneAddExpense"{
            let name: String = expenseTitle.text!
            self.expense = Expense(title: name)
            self.expense!.tripConcerned = self.trip
        } else {
            self.expense = nil
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
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        saveButton.isEnabled = false
    }
    
    private func updateSaveButtonState() {
        // Disable the Save button if the text field is empty.
        let nameText = expenseTitle.text ?? ""
        saveButton.isEnabled = !nameText.isEmpty
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        updateSaveButtonState()
        navigationItem.title = textField.text
    }
}
