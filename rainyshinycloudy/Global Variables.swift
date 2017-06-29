//
//  Constants.swift
//  rainyshinycloudy
//
//  Created by Robert Blundell on 01/06/2017.
//  Copyright © 2017 Robert Blundell. All rights reserved.
//

import Foundation

let firstparturl = "http://api.openweathermap.org/data/2.5/weather?"
let latitude = "lat="
let longtitude = "&lon="
let appid = "&appid="
let APIkey = "24b45530f3d9d3aab62431a5a27e5655"

let currentweatherapicall = "\(firstparturl)\(latitude)\(Location.mysingleton.latitude!)\(longtitude)\(Location.mysingleton.longitude!)\(appid)\(APIkey)"

let firstparturl2 = "http://api.openweathermap.org/data/2.5/forecast/daily?"
let cnt = "&cnt="

let forecastweatherapicall = "\(firstparturl2)\(latitude)\(Location.mysingleton.latitude!)\(longtitude)\(Location.mysingleton.longitude!)\(cnt)10\(appid)\(APIkey)"

var dayoftheweek = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]

