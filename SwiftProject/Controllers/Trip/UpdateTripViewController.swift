//
//  UpdateTripViewController.swift
//  SwiftProject
//
//  Created by Aubin ABADIE on 02/04/2019.
//  Copyright © 2019 Aubin ABADIE & Nathan TRAINEAU. All rights reserved.
//

import Foundation
import UIKit

class UpdateTripViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
    var trip: Trip!
    var image: UIImage?
    let imagePicker = UIImagePickerController()
    
    @IBOutlet weak var tripName: UITextField!
    @IBOutlet weak var tripImage: UIImageView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    
    @IBOutlet weak var personTableView: UITableView!
    @IBOutlet weak var personName: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tripName.text = self.trip.name
        self.image = self.trip.image
        self.tripName.delegate = self
        self.imagePicker.delegate = self
        self.personName.delegate = self
        self.updateSaveButtonState()
        self.personTableView.dataSource = self
        self.personTableView.delegate = self
    }
    
    @IBAction func updateTrip(_ sender: Any) {
        self.trip.tname = tripName.text
        if let image = tripImage.image {
            self.trip.timage = image.jpegData(compressionQuality: 0.8)
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
        saveButton.isEnabled = true
    }
    
    private func updateSaveButtonState() {
        // Disable the Save button if the text field is empty.
        let nameText = tripName.text ?? ""
        saveButton.isEnabled = !nameText.isEmpty
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        self.updateSaveButtonState()
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
        self.trip.addToPersonsOfTrip(Person(name: personName.text!))
        self.personName.text = ""
        self.personTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.trip.lPersons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = personTableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath) as? PersonTableViewCell else {
            fatalError("The dequeued cell is not an instance of PersonTableViewCell.")
        }
        
        return configure(cell: cell, atIndexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let alert = UIAlertController(title: "Suppression d'un participant", message: "Vous perdrez toutes les données la concernant. Êtes-vous sûr de vouloir continuer ?", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Oui", style: .default, handler: { action in
                let person = self.trip.lPersons[indexPath.row]
                person.pexitDate = NSDate() as Date
                self.personTableView.reloadData()
                let cell = self.personTableView.cellForRow(at: indexPath) as! PersonTableViewCell
                cell.selectionStyle = UITableViewCell.SelectionStyle.none;
                cell.isUserInteractionEnabled = false;
                cell.backgroundColor = UIColor.orange;
            }))
            alert.addAction(UIAlertAction(title: "Non", style: .cancel, handler: nil))
            
            self.present(alert, animated: true)
        }
    }
    
    private func configure(cell: PersonTableViewCell, atIndexPath indexPath: IndexPath) -> UITableViewCell {
        let person = self.trip.lPersons[indexPath.row]
        cell.person = person
        cell.personName.text = person.pname
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        let entryDate = formatter.string(from: person.pentryDate!)
        var exitDate = ""
        if let exit = person.pexitDate {
            exitDate = formatter.string(from: exit)
            cell.selectionStyle = UITableViewCell.SelectionStyle.none;
            cell.isUserInteractionEnabled = false;
            cell.backgroundColor = UIColor.orange;
        }
        
        cell.entryDate.text = entryDate
        cell.exitDate.text = exitDate
        return cell
    }
}
