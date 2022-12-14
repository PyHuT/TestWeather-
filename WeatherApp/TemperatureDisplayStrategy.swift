//
//  TemperatureDisplayStrategy.swift
//  WeatherApp
//
//  Created by Ihor Golia on 26.10.2022.
//

import Foundation
import SwiftUI

struct TemperatureDisplayStrategy {
    
    enum Strategy {
        case kelvin
        case celsius
        case fahrenheit
    }
    
    @State var type: Strategy
    
    func toDisplay(_ temperature: Double) -> Double {
        switch type {
            
        case .kelvin:
            return temperature + 273.15
        case .celsius:
            return temperature
        case .fahrenheit:
            return temperature * 1.8 + 32
        }
    }
    
    func display(_ temperature: Double) -> String {
        let value = toDisplay(temperature)
        return String(format: "%.2f", value)
    }
    
    func fromDisplay(_ temperature: Double) -> Double {
        switch type {
            
        case .kelvin:
            return temperature - 273.15
        case .celsius:
            return temperature
        case .fahrenheit:
            return (temperature - 32) / 1.8
        }
    }
}
