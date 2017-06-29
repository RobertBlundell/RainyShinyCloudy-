//
//  weathercell.swift
//  rainyshinycloudy
//
//  Created by Robert Blundell on 05/06/2017.
//  Copyright © 2017 Robert Blundell. All rights reserved.
//

import UIKit

class weathercell: UITableViewCell {
    
    @IBOutlet weak var weathericonsmall: UIImageView!
    @IBOutlet weak var dayincell: UILabel!
    @IBOutlet weak var weatherincell: UILabel!
    @IBOutlet weak var hightempincell: UILabel!
    @IBOutlet weak var lowtempincell: UILabel!
    
    func configurecell(forecast: forecast) {
        weathericonsmall.image = UIImage(named: forecast.weathertype)
        dayincell.text = dayoftheweek[Int(forecast.date)! - 1]
        weatherincell.text = forecast.weathertype
        hightempincell.text = forecast.hightemp
        lowtempincell.text = forecast.lowtemp
    }
    
}
