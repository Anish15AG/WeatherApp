//
//  LocationManager.swift
//  WeatherApp
//
//  Created by Anish Gurusankar on 08/04/25.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate{
    
    let manager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading = false
     
    override init() {
        super.init()
        manager.delegate = self
         
    }
    func requestLocation(){
        isLoading = true
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        isLoading = false
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print("Error getting Location", error)
        isLoading = false 
    }
}
