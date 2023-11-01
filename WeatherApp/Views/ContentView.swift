//
//  ContentView.swift
//  WeatherApp
//
//  Created by Марк Поляков on 30.10.2023.
//

import SwiftUI

struct ContentView: View {
        
    @State var weatherCardArray = [ WeatherCardView(city: "Tyumen"),  WeatherCardView(city: "Moscow"), WeatherCardView(city: "Tokio")]
    
    @State var isSearchViewShow = false
    
    var body: some View {
        ZStack{
            Image("background")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                
                header
                
                ScrollView(.horizontal){
                    HStack {
                        ForEach(weatherCardArray, id: \.city) { weatherCard in
                            weatherCard
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
                Image(systemName: "list.bullet")
                    .bold()
                    .foregroundColor(.white)
                    .font(.title2)
            })
            
            
            Text("Weather")
                .bold()
                .foregroundColor(.white)
                .font(.title2)
            
            Button(action: {
                isSearchViewShow.toggle()
            }, label: {
                Image(systemName: "magnifyingglass")
                    .bold()
                    .foregroundColor(.white)
                    .font(.title2)
            })
            .sheet(isPresented: $isSearchViewShow, content: {
                SearchView()
            })
        }
        .padding()
    }
}

