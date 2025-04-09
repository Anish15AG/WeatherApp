//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by Anish Gurusankar on 10/04/25.
//

import Foundation
import CoreLocation

class WeatherManager{
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws{
        //Retrieving API key from Info.plist
        guard let apiKey = Bundle.main.infoDictionary?["WeatherAPIKey"] as? String else {
                    fatalError("API Key not found in Info.plist")
                }

                //Create the URL with the retrieved API key
                guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)&units=metric") else {
                    fatalError("Missing URL")
                }
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {fatalError("Error fetching weather data")}
        
        
    }
}
