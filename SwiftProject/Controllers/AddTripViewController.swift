//
//  AddTripViewController.swift
//  SwiftProject
//
//  Created by Nathan TRAINEAU on 22/03/2019.
//  Copyright © 2019 Aubin ABADIE & Nathan TRAINEAU. All rights reserved.
//

import UIKit

class AddTripViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate {
    
    var trip: Trip?
    var imagePicker = UIImagePickerController()
    var image: UIImage?
    @IBOutlet weak var tripName: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tripName.delegate = self
        imagePicker.delegate = self
        
        updateSaveButtonState()
    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "DoneAddTrip"{
            let name = tripName.text!
            self.trip = Trip(name: name)
        } else {
            self.trip = nil
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
        let nameText = tripName.text ?? ""
        saveButton.isEnabled = !nameText.isEmpty
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        updateSaveButtonState()
        navigationItem.title = textField.text
    }
}
