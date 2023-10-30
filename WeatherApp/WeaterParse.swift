//
//  WeaterParse.swift
//  WeatherApp
//
//  Created by Марк Поляков on 30.10.2023.
//

import Foundation

import Foundation

func WeaterParse(city: String) -> WeatherCardModel {
    
    let firstPartApi = "https://api.openweathermap.org/data/2.5/weather?q="
    let secondPartApi = "&appid=c5ba8bde02ec7b8bc7901ead146c814e"
    
    let url = URL(string: firstPartApi+city+secondPartApi)
    
    if let url = url {
        
        var request = URLRequest(url: url)
        var result: WeatherCardModel?
        
        let semaphore = DispatchSemaphore(value: 0) // Создаем блокировку с нулевым значением
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, let info = try? JSONDecoder().decode(Weather.self, from: data) {
                result = WeatherCardModel(city: city, temperature: info.main.temp, feelsLike: info.main.feelsLike, visibility: info.visibility, lon: info.coord.lon, lat: info.coord.lat)
            } else {
                result = WeatherCardModel(city: "NO", temperature: 0, feelsLike: 0, visibility: 0, lon: 0, lat: 0)
            }
            semaphore.signal() // Освобождаем блокировку
        }
        task.resume()
        
        semaphore.wait() // Ожидаем завершения запроса
        
        return result ?? WeatherCardModel(city: "NO", temperature: 0, feelsLike: 0, visibility: 0, lon: 0, lat: 0)
        
    } else {
        return WeatherCardModel(city: "NO", temperature: 0, feelsLike: 0, visibility: 0, lon: 0, lat: 0)
    }
}

func currentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        return dateFormatter.string(from: Date())
    }

func celsiusToKelvin(_ celsius: Double) -> Int {
        let kelvin = celsius - 273.15
        return Int(kelvin.rounded()) // Округляем до ближайшего целого числа
    }


