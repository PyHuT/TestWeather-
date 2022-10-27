//
//  SettingsView.swift
//  WeatherApp
//
//  Created by Ihor Golia on 26.10.2022.
//

import Foundation
import SwiftUI

struct SettingsView: View {
    
//    @Environment(\.managedObjectContext) private var viewContext
   
    
    var strategy: TemperatureDisplayStrategy
    @StateObject var store: CityStore
    
//    @State private var cities: [City]
    @State private var selectedCity: City
    @State private var selectedSize: CitySize
    
     init(strategy: TemperatureDisplayStrategy, store: CityStore) {
         
        selectedCity = store.cities.first!
        _store = StateObject(wrappedValue: store)
        
        self.strategy = strategy

        let selectedCity = store.cities.first!
        selectedSize = selectedCity.size

    }

    
    public var body: some View {
        ZStack {
            VStack {

                
                Picker(selection: $selectedCity, label: Text("Data")) {
                    ForEach(store.cities) { city in
                        Text(city.name ?? "")
                            .tag(city)
                    }
                }
                .pickerStyle(.wheel)
                
                HStack {
                    Text("Size")
                    Spacer()
                    Picker("Size", selection: $selectedSize, content: {
                        ForEach(CitySize.allCases, id:\.self) {
                            Text("\($0.displayName)")
                        }
                    })
                    .pickerStyle(.segmented)
                    
                }
                
                
                List {
                    ForEach(selectedCity.temperatures.sorted(by: { t1, t2 in
                        t1.mounth.rawValue < t2.mounth.rawValue
                    })) { temperature in
                        HStack {
                            Text("\(temperature.mounth.displayName)")
                            Spacer()
                            EditField(temperature: temperature, strategy: strategy, save: store.save)
                                .frame(alignment: .trailing)
                                .keyboardType(.numbersAndPunctuation)
                        }
                    }
                }
                 
            }
        }
        .onChange(of: selectedCity) { newValue in
            selectedSize = newValue.size
        }
        .onChange(of: selectedSize) { newValue in
            selectedCity.size = newValue
            store.save()
        }
    }
}

struct EditField: View {
//    @Environment(\.managedObjectContext) private var viewContext
    
    var temperature: Temperature
    var strategy: TemperatureDisplayStrategy
    @State var value: String
    var save: ()->()
    
    init(temperature: Temperature, strategy: TemperatureDisplayStrategy, save: @escaping ()->()) {
        self.temperature = temperature
        self.strategy = strategy
        value = strategy.display(temperature.celsius)
        self.save = save
    }
    
    var body: some View {
        TextField("", text: $value, onEditingChanged: { isEditing in
            if !isEditing {
                temperature.celsius = strategy.fromDisplay(Double(value) ?? 0.0)
                save()
            }
        })
         
        .keyboardType(.numbersAndPunctuation)
    }
}


