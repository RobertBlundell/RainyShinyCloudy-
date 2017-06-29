//
//  File.swift
//  rainyshinycloudy
//
//  Created by Robert Blundell on 09/06/2017.
//  Copyright © 2017 Robert Blundell. All rights reserved.
//

import Foundation
import CoreLocation

class Location {
    static var mysingleton = Location()
    
    var latitude: Double?
    var longitude: Double?
    
    init() {}
}
