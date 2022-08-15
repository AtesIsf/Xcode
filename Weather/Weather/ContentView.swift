//
//  ContentView.swift
//  Weather
//
//  Created by Ateş İsfendiyaroğlu on 13.08.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            
            VStack {
                CityView(cityName: "Istanbul, TR")
                
                TodayView(img: isNight
                          ? "moon.stars.fill" : "cloud.sun.fill",
                          temp: 32)
                
                Spacer()
                
                HStack(spacing: 20) {
                    DayView("Mon", "wind", 36)
                    DayView("Tue", "sun.max.fill", 30)
                    DayView("Wed", "cloud.fill", 28)
                    DayView("Thu", "cloud.drizzle.fill", 31)
                    DayView("Fri", "cloud.sun.rain.fill", 33)
                }
                Spacer()
                
                Button {
                    isNight.toggle() // true <-> false
                } label: {
                    Text("Day/Night")
                        .foregroundColor(.blue)
                        .frame(width: 150, height: 20)
                }
                Spacer()
            }
        }
    }
}

struct DayView: View {
    let date: String
    let img: String
    let temp: Int
    
    init(_ date: String, _ img: String, _ temp: Int) {
        self.date = date
        self.img = img
        self.temp = temp
    }
    
    var body: some View {
        VStack {
            Text(date)
                .font(.system(size: 25))
                .foregroundColor(.white)
            Image(systemName: img)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            Text("\(temp)°")
                .font(.system(size: 25))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool
    
    var body: some View {
        
        LinearGradient(colors: [
                        isNight ? .black : .blue,
                        isNight ? .gray : .cyan,
                        isNight ? .gray : Color("AtsBlue"),
                    ],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
    }
}

struct CityView: View {
    let cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 35))
            .padding()
            .foregroundColor(.white)
    }
}

struct TodayView: View {
    let img: String
    let temp: Int
    
    var body: some View {
        VStack(spacing: 5) {
            Image(systemName: img)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
            
            Text("\(temp)°")
                .font(.system(size: 30))
                .foregroundColor(.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
