//
//  ContentView.swift
//  WeatherApp
//
//  Created by Anish Gurusankar on 08/04/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
        VStack {
            WelcomeView().environmentObject(locationManager)
        }
        .background(Color(hue: 0.603, saturation: 0.674, brightness: 0.898))
        .preferredColorScheme(.dark)
        .padding()
    }
}

#Preview {
    ContentView()
}
