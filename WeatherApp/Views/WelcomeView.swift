//
//  WelcomeView.swift
//  WeatherApp
//
//  Created by Anish Gurusankar on 08/04/25.
//

import SwiftUI

struct WelcomeView: View {
    
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        VStack(spacing: 20){
            Text("Welcome to the Weather App")
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity )
    }
}

#Preview {
    WelcomeView()
}
