//
//  ContentView.swift
//  WeatherApp
//
//  Created by Ihor Golia on 26.10.2022.
//

import SwiftUI
import CoreData

struct ContentView: View {

    @StateObject var tempBarStorage =  TemperatureObserver.shared
    @StateObject var store: CityStore
    @State private var selectedCity: City
    @State private var selectedSeason: Season = .winter
    
    var strategy = TemperatureDisplayStrategy(type: TemperatureObserver.shared.strategyType)
    
    init(store: CityStore) {

        selectedCity = store.cities.first!
        _store = StateObject(wrappedValue: store)
    }
    
    
    var body: some View {
        NavigationView {
            
            VStack {
                HStack {
                    Spacer()
                    NavigationLink(destination: SettingsView(strategy: strategy,
                                                             store: store),
                                   label: {
                        Text("Settings")
                    })
                    
                }
                
                
                HStack {
                    Picker(selection: $selectedCity,
                           label: Text("")) {
                        ForEach(store.cities) { city in
                            Text(city.name ?? "")
                                .tag(city)
                        }
                    }
                           .pickerStyle(.inline)
                    
                    Button {
                        tempBarStorage.displayCityName = selectedCity.name
                        tempBarStorage.displaySeason = selectedSeason
                    } label: {
                        Text("Pin")
                    }

                }
                

                Text("Size \(CityTypeFactory(city: selectedCity).size())")
                
                Picker(selection: $selectedSeason, label: Text("")) {
                    ForEach(Season.allCases, id: \.self) { season in
                        Text(season.rawValue)
                    }
                }
                .pickerStyle(.segmented)
                
                if let city = selectedCity {

                    Text(strategy.display((SeasonDecorator(city: city).seasonTemperature(season: selectedSeason))))
                }
                
                
                Spacer()
            }
            .padding(.horizontal, 16)
            .overlay {
                if let message = tempBarStorage.displayMessage {
                    ZStack {
                        
                        VStack {
                            Spacer()
                            Text("\(message)")
                                .background(Color.brown)
                        }
                        
                    }
                }
     
            }
        }
        .navigationBarHidden(true)
        .navigationBarTitle("")
        .statusBar(hidden: true)
        
    }

}



