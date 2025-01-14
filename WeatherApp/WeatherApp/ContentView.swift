//
//  ContentView.swift
//  WeatherApp
//
//  Created by Kacem Ettahali on 12/18/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            
            BackgroundView(isNight: $isNight)
            
            VStack {
                CityTextView(cityName: "Houston, TX")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: isNight ? 67 : 76)
                
                HStack(spacing: 20){
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: "cloud.sun.fill",
                                   temp: 74)
                    WeatherDayView(dayOfWeek: "WED", 
                                   imageName: "sun.max.fill",
                                   temp: 80)
                    WeatherDayView(dayOfWeek: "THU",
                                   imageName: "wind",
                                   temp: 66)
                    WeatherDayView(dayOfWeek: "FRI", 
                                   imageName: "cloud.drizzle.fill",
                                   temp: 60)
                    WeatherDayView(dayOfWeek: "SAT", 
                                   imageName: "sun.haze.fill",
                                   temp: 70)
                }
                Spacer()
                
                Button{
                    isNight.toggle()
                } label:{
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var dayOfWeek : String
    var imageName: String
    var temp: Int
    
    
    var body: some View {
        VStack{
            Text("\(dayOfWeek)")
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: "\(imageName)")
                .resizable()
                .renderingMode(.original)
                .frame(width: 40, height: 40)
                .aspectRatio(contentMode: .fit)
            Text("\(temp)°")
                .font(.system(size: 29, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View{
    var cityName : String
    var body: some View{
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View{
        VStack(spacing: 8){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height:180)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
                .padding(.bottom)
        }
        .padding(.bottom, 40)
    }
}

struct WeatherButton: View {
    
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View{
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
    
}
