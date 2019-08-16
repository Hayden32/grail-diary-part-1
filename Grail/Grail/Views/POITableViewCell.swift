//
//  POITableViewCell.swift
//  Grail
//
//  Created by Hayden Hastings on 8/15/19.
//  Copyright © 2019 Hayden Hastings. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {
    
    // MARK: - Properties
    var poi: POI? {
        didSet {
            
        }
    }

    // MARK: - IBOutlets
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var numberOfCluesLabel: UILabel!
    
    // MARK: - Methods
    func updateViews() {
        guard let poi = poi else { return }
        
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        numberOfCluesLabel.text = "\(poi.clues.count)"
    }
}
