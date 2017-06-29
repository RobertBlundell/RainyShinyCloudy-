//
//  Forecast.swift
//  rainyshinycloudy
//
//  Created by Robert Blundell on 02/06/2017.
//  Copyright © 2017 Robert Blundell. All rights reserved.
//

import Alamofire
import Foundation

class forecast {
    
    private var _date: String!
    private var _weathertype: String!
    private var _hightemp: String!
    private var _lowtemp: String!
    
    var date: String {
        if _date == nil {
            _date = "error"
        }
        return _date
    }

    var weathertype: String {
        if _weathertype == nil {
            _weathertype = "error"
        }
        return _weathertype
    }
    
    var hightemp: String {
        if _hightemp == nil {
            _hightemp = ""
        }
        return _hightemp
    }
    
    var lowtemp: String {
        if _lowtemp == nil {
            _lowtemp = ""
        }
        return _lowtemp
    }
    
    init(weatherDict: Dictionary<String,Any>) {
        
        if let temp = weatherDict["temp"] as? Dictionary<String,AnyObject> {
            if let max = temp["max"] as? Double {
                let maxadjusted = max - 273.15
                self._hightemp = String(Int(maxadjusted))
            }
            if let min = temp["min"] as? Double {
                let minadjusted = min - 273.15
                self._lowtemp = String(Int(minadjusted))
            }
        }
        
        if let weatherdescription = weatherDict["weather"] as? [Dictionary<String,AnyObject>] {
            if let main = weatherdescription[0]["main"] as? String {
                self._weathertype = main
            }
        }
        
        if let dt = weatherDict["dt"] as? TimeInterval {
            let actualdate = Date(timeIntervalSince1970: dt)
            let weekday = Calendar.current.component(.weekday, from: actualdate)
            self._date = String(weekday)
        }
        
    }
    
}



















