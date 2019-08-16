//
//  POIDetailViewController.swift
//  Grail
//
//  Created by Hayden Hastings on 8/15/19.
//  Copyright © 2019 Hayden Hastings. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {
    
    // MARK: - Properties
    var poi: POI?
    
    // MARK: - IBOutlets
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesTextView: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }
    
    // MARK: - Methods
    
    private func updateViews() {
        guard let poi = poi else { return }
        
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        
        // From array to string
        var clueString = ""
        
        let clues = poi.clues
        
        for clue in clues {
            clueString.append(clue)
            clueString.append("\n")
        }
        cluesTextView.text = clueString
    }
}
