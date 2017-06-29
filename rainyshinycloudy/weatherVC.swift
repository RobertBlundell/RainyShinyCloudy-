//
//  ViewController.swift
//  rainyshinycloudy
//
//  Created by Robert Blundell on 31/05/2017.
//  Copyright © 2017 Robert Blundell. All rights reserved.
//

import UIKit
import CoreLocation

class weatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {
    
    @IBOutlet weak var datelabel: UILabel!
    @IBOutlet weak var temperaturelabel: UILabel!
    @IBOutlet weak var currentlocationlabel: UILabel!
    @IBOutlet weak var currentweathericon: UIImageView!
    @IBOutlet weak var currentweatherdescription: UILabel!
    @IBOutlet weak var weathertableview: UITableView!
    
    let locationmanager = CLLocationManager()
    var currentlocation = CLLocation()
    
    var currentweathervar: currentweather!
    var tabledata: [forecast] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationauthoristationstatus()
        
        locationmanager.delegate = self
        locationmanager.desiredAccuracy = kCLLocationAccuracyBest
        locationmanager.startMonitoringSignificantLocationChanges()
        
        weathertableview.delegate = self
        weathertableview.dataSource = self
        
        currentweathervar = currentweather()
        currentweathervar.downloadweatherdetails {
            self.loadweatherdata()
        }
        
        downloadweatherdata(parsing: {} , completion: { (forecasts) in
            self.tabledata = forecasts
            self.weathertableview.reloadData()
        })
    }
    
    func locationauthoristationstatus() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            let currentlocation = locationmanager.location
            Location.mysingleton.latitude = (currentlocation?.coordinate.latitude)!
            Location.mysingleton.longitude = (currentlocation?.coordinate.longitude)!
            print("Here is your latitude: \(String(describing: Location.mysingleton.latitude)) and your longitude: \(String(describing: Location.mysingleton.longitude ))")
        } else {
            locationmanager.requestWhenInUseAuthorization()
            locationauthoristationstatus()
        }
    }
    
    func tableView(_ weathertableview: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tabledata.count != 0 {
            return tabledata.count
        } else { return 0 }
    }
    
    func tableView(_ weathertableview: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = weathertableview.dequeueReusableCell(withIdentifier: "weathercell", for: indexPath) as? weathercell {
            let forecastofxday = self.tabledata[indexPath.row]
            cell.configurecell(forecast: (forecastofxday))
            return cell
        } else {
            return weathercell()
        }
    }
    
    func numberOfSections(in weathertableview: UITableView) -> Int {
        return 1
    }
    
    func loadweatherdata() {
        datelabel.text = currentweathervar.date
        temperaturelabel.text = currentweathervar.currenttemperature + "°C"
        currentlocationlabel.text = currentweathervar.cityname
        currentweatherdescription.text = currentweathervar.weathertype
        currentweathericon.image = UIImage(named: currentweathervar.weathertype)
    }
    
}


