//
//  AddTripViewController.swift
//  SwiftProject
//
//  Created by Nathan TRAINEAU on 22/03/2019.
//  Copyright © 2019 Aubin ABADIE & Nathan TRAINEAU. All rights reserved.
//

import UIKit

/*class AddTripViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        inputFirstName.delegate = self
        inputName.delegate = self
        
        updateSaveButtonState()
    }
    
    var person: Personne?
    
    lazy var personModel: PersonTableViewModel = {
        return PersonTableViewModel()
    }()
    
    @IBOutlet weak var inputName: UITextField!
    
    @IBOutlet weak var inputFirstName: UITextField!
    
    @IBOutlet weak var inputDate: UIDatePicker!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    
    @IBAction func cancel(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "DoneAddPerson"{
            let firstname = inputFirstName.text!
            let lastname = inputName.text!
            let birthdate = inputDate.date
            self.person = Personne(firstname: firstname, lastname: lastname, birthdate: birthdate)
        }
        else{
            self.person = nil
        }
    }
    
    //MARK: TextFieldDelegate
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
        let nameText = inputName.text ?? ""
        let firstNameText = inputFirstName.text ?? ""
        saveButton.isEnabled = !nameText.isEmpty && !firstNameText.isEmpty
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        updateSaveButtonState()
        navigationItem.title = textField.text
    }
    
}
*/
