//
//  WeatherCardModel.swift
//  WeatherApp
//
//  Created by Марк Поляков on 30.10.2023.
//

import Foundation

struct WeatherCardModel: Identifiable{
    var id = UUID()
    var city: String
    var temperature: Double
    var feelsLike: Double
    var visibility: Int
    var lon: Double
    var lat: Double
}
