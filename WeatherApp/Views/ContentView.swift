//
//  ContentView.swift
//  WeatherApp
//
//  Created by Anish Gurusankar on 08/04/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    var body: some View {
        VStack {
            
            if let location = locationManager.location{
                if let weather = weather{
                    WeatherView(weather: weather)
                } else{
                    LoadingView()
                        .task {
                            do{
                                weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                                
                            } catch{
                                print("Error getting weather: \(error)")
                            }
                        }
                }
            } else {
                if locationManager.isLoading{
                    LoadingView()
                } else {
                    
                    WelcomeView().environmentObject(locationManager)
                }
            }
        }
        .background(Color(hue: 0.603, saturation: 0.886, brightness: 0.814))
        .preferredColorScheme(.dark)
        .padding()
    }
}

#Preview {
    ContentView()
}
