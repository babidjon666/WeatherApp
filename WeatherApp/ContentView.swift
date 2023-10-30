//
//  ContentView.swift
//  WeatherApp
//
//  Created by Марк Поляков on 30.10.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Image("background")
                .resizable()
                .ignoresSafeArea()
        }
        
    }
}

#Preview {
    ContentView()
}
