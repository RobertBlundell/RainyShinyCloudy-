//
//  currentweather.swift
//  rainyshinycloudy
//
//  Created by Robert Blundell on 01/06/2017.
//  Copyright © 2017 Robert Blundell. All rights reserved.
//

import Alamofire

class currentweather {
    private var _cityname: String!
    private var _date: String!
    private var _weathertype: String!
    private var _currenttemperature: String!
    
    var cityname: String {
        if _cityname == nil {_cityname = ""}
        return _cityname
    }
    
    var date: String {
        if _date == nil {_date = ""}
        let dateformatter = DateFormatter()
        dateformatter.dateStyle = .long
        dateformatter.timeStyle = .none
        let currentdate = dateformatter.string(from: Date())
        _date = "Today, \(currentdate)"
    
        return _date
    }
    
    var weathertype: String {
        if _weathertype == nil {_weathertype = ""}
        return _weathertype
    }
    
    var currenttemperature: String {
        if _currenttemperature == nil {_currenttemperature = ""}
        return _currenttemperature
    }
    
    func downloadweatherdetails(completed: @escaping () -> ()) {
        let currentweatherURL = URL(string: currentweatherapicall)!
        print("Defined current weather API call")
        Alamofire.request(currentweatherURL).responseJSON {
            response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String,AnyObject> {
            
                if let name = dict["name"] as? String {
                    self._cityname = name.capitalized
                }
                
                if let weathertypedict = dict["weather"] as? Array<Dictionary<String, AnyObject>> {
                    
                    if let weathertype = weathertypedict[0]["main"] as? String {
                        self._weathertype = weathertype.capitalized
                    }
                }
                
                if let maindictionary = dict["main"] as? Dictionary<String,AnyObject> {
                    if let currenttemp = maindictionary["temp"] as? Double {
                        let celsiuscurrenttemperature = currenttemp - 273.15
                        self._currenttemperature = String(celsiuscurrenttemperature)
                    }
                }
            }
            completed()
        }
        
    }
    
}

