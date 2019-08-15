//
//  AddPOIViewController.swift
//  Grail
//
//  Created by Hayden Hastings on 8/15/19.
//  Copyright © 2019 Hayden Hastings. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func poiWasAdded(_ poi: POI)
}

class AddPOIViewController: UIViewController {
    
    // MARK: - Properties
    
    var delegate: AddPOIDelegate?

    // MARK: - IBOutlets
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var clue1TextFiled: UITextField!
    @IBOutlet weak var clue2TextField: UITextField!
    @IBOutlet weak var clue3TextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    // MARK: - IBActions
    
    @IBAction func SaveButtonTapped(_ sender: Any) {
        
        guard let location = locationTextField.text,
            let country = countryTextField.text,
            !location.isEmpty,
            !country.isEmpty else { return }
        
        var poi = POI(location: location, country: country, clues: [])
        
        if let clue1 = clue1TextFiled.text,
            !clue1.isEmpty {
            poi.clues.append(clue1)
        }
        
        if let clue2 = clue2TextField.text,
            !clue2.isEmpty {
            poi.clues.append(clue2)
        }
        
        if let clue3 = clue3TextField.text,
            !clue3.isEmpty {
            poi.clues.append(clue3)
        }
        
        delegate?.poiWasAdded(poi)
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension AddPOIViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text,
            !text.isEmpty {
            switch textField {
            case locationTextField:
                countryTextField.resignFirstResponder()
            case countryTextField:
                clue1TextFiled.resignFirstResponder()
            case clue1TextFiled:
                clue2TextField.resignFirstResponder()
            case clue2TextField:
                clue3TextField.resignFirstResponder()
            default:
                textField.resignFirstResponder()
            }
        }
        return false
    }
}
