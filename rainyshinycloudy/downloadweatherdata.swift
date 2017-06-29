//
//  downloadweatherforecast.swift
//  rainyshinycloudy
//
//  Created by Robert Blundell on 03/06/2017.
//  Copyright © 2017 Robert Blundell. All rights reserved.
//

import Foundation
import Alamofire

func downloadweatherdata(parsing: @escaping () -> (), completion: @escaping (_: [forecast]) -> ()) {
    var forecasts = [forecast]()
    DispatchQueue.global(qos: .userInteractive).async {
        let forecastweatherurl = URL(string: forecastweatherapicall)
        print("defined forecast API call")
        Alamofire.request(forecastweatherurl!).responseJSON {
            response in
            let result = response.result
            if let datatoparse = result.value as? Dictionary<String,AnyObject> {
                if let list = datatoparse["list"] as? [Dictionary<String,Any>] {
                    for obj in list {
                        let forecastinstance = forecast(weatherDict: obj)
                        forecasts.append(forecastinstance)
                    }
                }
            }
            parsing()
            DispatchQueue.main.async {
                completion(forecasts)
            }
        }
    }
}





