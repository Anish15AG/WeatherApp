//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Anish Gurusankar on 10/04/25.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    var body: some View {
        ZStack(alignment: .leading){
            
            VStack{
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .bold().font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                
                Spacer()
                
                VStack{
                    HStack{
                        VStack(spacing: 20){
                            Image(systemName: "sun.max")
                                .font(.system(size: 40))
                            
                            Text(weather.weather[0].main)
                             
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Text("\(weather.main.feels_like.roundDouble())" + "°")
                            .font(.system(size: 100))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .padding()
                    }
                    
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.603, saturation: 0.886, brightness: 0.814))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    WeatherView(weather: previewWeather)
}
