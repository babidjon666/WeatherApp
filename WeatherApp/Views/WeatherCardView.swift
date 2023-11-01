//
//  WeatherCardView.swift
//  WeatherApp
//
//  Created by Марк Поляков on 31.10.2023.
//

import SwiftUI
import MapKit

struct WeatherCardView: View {
    
    @State private var weatherModel: WeatherCardModel?
    @State private var annotationCoordinate: CLLocationCoordinate2D?
    
    var city: String
    
    @State private var region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 55.780588, longitude: 37.590677), span: MKCoordinateSpan(latitudeDelta: 100, longitudeDelta: 100))
    
    var body: some View {
        ZStack{
            VStack{
                VStack {
                    Text(weatherModel?.city ?? "Loading...") // Название города
                        .font(.title2)
                        .bold()
                    
                    Text(currentDate()) // Дата
                        .font(.subheadline)
                }
                .padding()
                
                Text("\(celsiusToKelvin(weatherModel?.temperature ?? 0))° C")
                    .padding()
                    .bold()
                    .font(.largeTitle)
                
                Text("Ощущается как \(celsiusToKelvin(weatherModel?.feelsLike ?? 0))° C")
                    .bold()
                
                Map(coordinateRegion: $region)
                    .frame(width: 250, height: 165)
                    .cornerRadius(30)
                    .shadow(radius: 10)
                
                Spacer()
            }
            .frame(width: 300, height: 400)
            .background(Color.white)
            .cornerRadius(30)
            
            Button(action: {
                
            }, label: {
                Circle()
                    .padding(.top, 400)
                    .frame(width: 60)
                    .foregroundColor(.white)
                    .shadow(radius: 10)
                    .overlay{
                        Image(systemName: "plus")
                            .padding(.top, 400)
                            .font(.title3)
                            .bold()
                            .foregroundColor(.gray)
                    }
            })
        }
        .padding(20)
        .onAppear {
            weatherModel = WeatherParse(city: city)
            region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: weatherModel?.lat ?? 0, longitude: weatherModel?.lon ?? 0), span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
        }
    }
}


#Preview {
    WeatherCardView(city: "Izrael")
}
