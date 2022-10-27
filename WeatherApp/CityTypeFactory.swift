//
//  CityTypeFactory.swift
//  WeatherApp
//
//  Created by Ihor Golia on 26.10.2022.
//

import Foundation

struct CityTypeFactory {
    
    var city: City
    
    init(city: City) {
        self.city = city
    }
    
    public func size() -> String {
        
        let cities = CityStore.shared.cities
        
        let newCity = cities.first {
            $0.name == city.name
        }!
        
        return newCity.size.displayName
    }
    
}
