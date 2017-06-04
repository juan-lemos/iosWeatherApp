//
//  dayWeatherCollectionViewCell.swift
//  obligatorio2
//
//  Created by JuanPablo on 6/3/17.
//  Copyright © 2017 UCUDAL. All rights reserved.
//

import UIKit

class DayWeatherCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherIconLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherIconLabelTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var temperatureLabelTopConstraint: NSLayoutConstraint!
    
}
