//
//  TemperatureObserver.swift
//  WeatherApp
//
//  Created by Ihor Golia on 26.10.2022.
//

import Foundation
import UIKit
import Combine

class TemperatureObserver: ObservableObject {
    @Published var displayMessage: String?
    
    var subscriptions = Set<AnyCancellable>()
    var strategyType: TemperatureDisplayStrategy.Strategy
    
    static var shared = TemperatureObserver()
    
    
    
    private init() {
        strategyType  = .celsius
        CityStore.shared.$cities.sink { [weak self] _ in
            self? .solveCity()
        }.store(in: &subscriptions)
    }
    
    func solveCity() {
        displayCity = CityStore.shared.cities.first(where: { city in
            city.name == displayCityName
        })
        updateMessage()
    }
    
    var displayCity: City?
    
    var displayCityName: String? {
        didSet {
            solveCity()
        }
    }
    
    var displaySeason: Season? {
        didSet {
            updateMessage()
        }
    }
    
    private func updateMessage() {
        guard let displayCity = displayCity,
              let cityName = displayCity.name,
              let displaySeason = displaySeason else {
            return
        }
        let strat = TemperatureDisplayStrategy(type: strategyType)
        let temp = SeasonDecorator(city: displayCity).seasonTemperature(season: displaySeason)
        displayMessage = "City \(cityName) Temp \(strat.display(temp))"
    }
    
    
}
