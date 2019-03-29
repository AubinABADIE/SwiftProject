//
//  AddTripViewController.swift
//  SwiftProject
//
//  Created by Nathan TRAINEAU on 22/03/2019.
//  Copyright © 2019 Aubin ABADIE & Nathan TRAINEAU. All rights reserved.
//

import UIKit

class AddTripViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
    var trip: Trip?
    var image: UIImage?
    let imagePicker = UIImagePickerController()
    
    @IBOutlet weak var tripName: UITextField!
    @IBOutlet weak var tripImage: UIImageView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    
    var persons: [Person] = []
    
    @IBOutlet weak var personTableView: UITableView!
    @IBOutlet weak var personName: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tripName.delegate = self
        self.imagePicker.delegate = self
        updateSaveButtonState()
        self.personTableView.dataSource = self
        self.personTableView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "DoneAddTrip"{
            let name: String = tripName.text!
            if let image = tripImage.image {
                self.trip = Trip(name: name, image: image)
            } else {
                self.trip = Trip(name: name)
            }
            for p in self.persons {
                trip?.addToPersons(p)
            }
        } else {
            self.trip = nil
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
        let nameText = tripName.text ?? ""
        saveButton.isEnabled = !nameText.isEmpty
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
        self.tripImage.image = image
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    // *********** PERSON TABLEVIEW ******************
    
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
        var exitDate = ""
        if let exit = person.pexitDate {
            exitDate = formatter.string(from: exit)
        }
        
        cell.setPersonCell(name: person.pname!, entry: entryDate, exit: exitDate)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
           // self.persons.remove(at: indexPath.row - 1)
        }
    }
}
