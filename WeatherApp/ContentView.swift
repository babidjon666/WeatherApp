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
            
            VStack {
                
                header
                
                ZStack{
                    VStack{
                        VStack {
                            Text("Moscow") // name of City
                                .font(.title2)
                            .bold()
                            
                            Text("Tuesday, July 05, 2016") // date
                                .font(.subheadline)
                        }
                        .padding()
                        
                        Text("26° C") // gradus
                            .padding()
                            .bold()
                            .font(.largeTitle)
                        
                        Spacer()
                    }
                    .frame(width: 300,height: 400)
                    .background(Color.white)
                    .cornerRadius(30)
                    
                    Button(action: {
                        // add to list
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
            })
            
            
            Text("Weather")
                .bold()
                .foregroundColor(.white)
                .font(.title2)
            
            Button(action: {
                //
            }, label: {
                Text("•••")
                    .bold()
                    .foregroundColor(.white)
                    .font(.title2)
            })
        }
        .padding()
    }
}
