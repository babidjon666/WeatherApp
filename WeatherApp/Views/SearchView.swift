//
//  SearchView.swift
//  WeatherApp
//
//  Created by Марк Поляков on 31.10.2023.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchCity = ""
    
    var capitals = ["Moscow", "Washington", "Paris", "Tokyo", "Beijing", "London", "Canberra", "Berlin", "Rome", "Athens", "Madrid", "Lisbon", "Oslo", "Stockholm", "Copenhagen", "Helsinki", "Ottawa", "Kiev", "Warsaw", "Prague", "Budapest", "Vienna", "Brussels", "Amsterdam", "Bern", "Ankara", "Ankara", "Cairo", "Rabat", "Algiers", "Tunis", "Khartoum", "Dakar", "Abuja", "Kinshasa", "Harare", "Nairobi", "Tehran", "Baghdad", "Riyadh", "Doha", "Kuwait", "Manama", "Abu Dhabi", "Doha", "Jakarta", "Bangkok", "Singapore", "Seoul"]
    
    var body: some View {
        ZStack{
           // Image("background")
               // .resizable()
               // .ignoresSafeArea()

            VStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.white)
                        .bold()
                        .padding(.leading, 10)
                    TextField("", text: $searchCity)
                        .foregroundColor(.white)
                        .bold()
                }
                .padding()
                .background(Color.init(hex: "#4f05a8"))
                .cornerRadius(10)
                .frame(width: 350, height: 50)
                .shadow(color: Color.init(hex: "#7132bf"), radius: 10)
                .padding()
                
                ScrollView(.vertical){
                    VStack{
                        ForEach(capitals, id: \.self) { city in
                            if searchCity.isEmpty || city.localizedCaseInsensitiveContains(searchCity) {
                                Button(action: {
                                    //
                                }, label: {
                                    Text(city)
                                        .frame(width: 300, height: 30)
                                        .foregroundColor(.white)
                                        .bold()
                                        .padding()
                                        .background(Color.init(hex: "#4f05a8"))
                                        .cornerRadius(10)
                                        .shadow(color: Color.init(hex: "#7132bf"), radius: 8)
                                        .padding(5)
                                })
                            }
                        }
                    }
                    .frame(width: 500, height: .infinity)
                }
                Spacer()
                
                
            }
        }
    }
}

#Preview {
    SearchView()
}
