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
    
    var citySelectionHandler: ((String) -> Void)
    
    @Binding var isSearchViewShown: Bool
    
    var body: some View {
        ZStack{
            Color.init(hex: "#7fc5f4").ignoresSafeArea()
            
            VStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.black)
                        .bold()
                        .padding(.leading, 10)
                    TextField("", text: $searchCity)
                        .foregroundColor(.black)
                        .bold()
                }
                .padding()
                .background(.white)
                .cornerRadius(10)
                .shadow(radius: 10)
                .frame(width: 350, height: 50)
                .padding()
                
                ScrollView(.vertical){
                    VStack{
                        ForEach(capitals, id: \.self) { city in
                            if searchCity.isEmpty || city.localizedCaseInsensitiveContains(searchCity) {
                                HStack{
                                    Text(city)
                                        .frame(width: 250, height: 30, alignment: .leading)
                                        .foregroundColor(.black)
                                        .bold()
                                        .padding()
                                    
                                    Button(action: {
                                        citySelectionHandler(city)
                                        isSearchViewShown.toggle()
                                    }, label: {
                                        Circle()
                                            .frame(width: 30)
                                            .foregroundColor(.white)
                                            .shadow(radius: 10)
                                            .overlay(
                                                Image(systemName: "plus")
                                                    .foregroundColor(.black)
                                                    .bold()
                                            )
                                            
                                    })
                                }
                                .frame(width: 370)
                                .background(.white)
                                .cornerRadius(10)
                                .padding(5)
                            }
                        }
                    }
                    .shadow(radius: 10)
                    .frame(width: 500, height: .infinity)
                }
                Spacer()
                
                
            }
        }
    }
}

#Preview {
    SearchView(citySelectionHandler: { selectedCity in
    }, isSearchViewShown: .constant(true))}
