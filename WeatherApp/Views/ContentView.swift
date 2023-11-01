//
//  ContentView.swift
//  WeatherApp
//
//  Created by Марк Поляков on 30.10.2023.
//

import SwiftUI

struct ContentView: View {
        
    @State var weatherCardArray = [ WeatherCardView(city: "Tyumen") ]
    
    @State var isSearchViewShown = false
    
    var body: some View {
        ZStack{
            Color.init(hex: "#7FC5F6").ignoresSafeArea()
            Image("2")
                .resizable()
                .frame(width: 500,height: 250)
                .ignoresSafeArea()
                .padding(.top,-380)
            
            VStack {
                
                header
                
                ScrollView(.horizontal){
                    HStack(spacing: -100) {
                        ForEach(weatherCardArray, id: \.city) { weatherCard in
                            weatherCard
                                .padding(.horizontal, 50)
                        }
                    }
                    .padding(30)
                }
                
                Spacer()
            }
        }
        
    }
}

#Preview {
    ContentView()
}

extension ContentView{
    
    var header: some View{
        HStack(spacing:100){
            Button(action: {
                //
            }, label: {
                Circle()
                    .frame(width: 40)
                    .foregroundColor(.white)
                    .shadow(radius: 10)
                    .overlay(
                        Image(systemName: "list.bullet")
                            .bold()
                            .foregroundColor(.black)
                            .font(.title2)
                    )
            })
            
            
            Text("Weather")
                .bold()
                .foregroundColor(.white)
                .font(.title2)
            
            Button(action: {
                isSearchViewShown.toggle()
            }, label: {
                Circle()
                    .frame(width: 40)
                    .foregroundColor(.white)
                    .shadow(radius: 10)
                    .overlay(
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.black)
                            .font(.title2)
                    )
            })
            .sheet(isPresented: $isSearchViewShown, content: {
                SearchView(citySelectionHandler: { selectedCity in
                    weatherCardArray.append(WeatherCardView(city: selectedCity))
                }, isSearchViewShown: $isSearchViewShown)
            })
        }
        .padding()
    }
}

