//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by Anish Gurusankar on 10/04/25.
//

import Foundation
import CoreLocation

class WeatherManager{
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> ResponseBody{
//        //Retrieving API key from Info.plist
//        guard let apiKey = Bundle.main.infoDictionary?["WeatherAPIKey"] as? String else {
//                    fatalError("API Key not found in Info.plist")
//                }

                //Create the URL with the retrieved API key
                guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=&units=metric") else {
                    fatalError("Missing URL")
                }
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {fatalError("Error fetching weather data")}
            
        let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)
        return decodedData
        
    }
}

struct ResponseBody: Decodable {
    var coord: CoordinatesResponse
    var weather: [WeatherResponse]
    var main: MainResponse
    var name: String
    var wind: WindResponse
    
    struct CoordinatesResponse: Decodable{
        var lon: Double
        var lat: Double
    }
    
    struct WeatherResponse: Decodable{
        var id: Double
        var main: String
        var description: String
        var icon: String
    }
    
    struct MainResponse: Decodable{
        var temp: Double
        var feels_like: Double
        var temp_min: Double
        var temp_max: Double
        var pressure: Double
        var humidity: Double
    }
    
    struct WindResponse: Decodable{
        var speed: Double
        var deg: Double
    }
}

extension ResponseBody {
    // Method to format the weather data as a string
    func formattedWeather() -> String {
        return "The weather in \(name) is \(weather.first?.description ?? "unknown") with a temperature of \(main.temp)°C."
    }
}
