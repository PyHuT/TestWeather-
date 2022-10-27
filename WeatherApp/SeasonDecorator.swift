//
//  SeasonDecorator.swift
//  WeatherApp
//
//  Created by Ihor Golia on 26.10.2022.
//

import Foundation

extension City {
    
    var temperatures: [Temperature] {
        let rez = temperature?.allObjects.compactMap({
            $0 as? Temperature
        }) ?? []
        
        return rez
    }

}

class SeasonDecorator {
    
    init(city: City) {
        self.city = city
    }
    
    
    var city: City
    
    func seasonTemperature(season: Season) -> Double {
        
        return getSeasonTemperature(season: season)
    }
    
    private func getSeasonTemperature(season: Season) -> Double {
        
        let val = city.temperatures.filter {
             $0.mounth.season == season
        }
        .map {
            $0.celsius
        }
        
        let avg = val.reduce(0) { partialResult, item in
            partialResult + item
        } / Double(val.count)
        print("avg temp \(avg)")
        
        return avg
    }
}
