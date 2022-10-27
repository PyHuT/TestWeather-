//
//  Month.swift
//  WeatherApp
//
//  Created by Ihor Golia on 26.10.2022.
//

import Foundation

@objc public enum CitySize: Int16, CaseIterable {
    case small
    case medium
    case large
    
    var displayName: String {
        switch self {
        case .small:
            return "Small"
        case .medium:
            return "Medium"
        case .large:
            return "Large"
        }
    }
}

@objc public enum Month: Int16, CaseIterable {
    case january = 0
    case february
    case march
    case april
    case may
    case june
    case july
    case august
    case september
    case october
    case november
    case december
    
    var season: Season {
        switch self {
            
        case .january, .february, .december:
            return .winter
        case .march, .april, .may:
            return .spring
        case .june, .july, .august:
            return .summer
        case .september, .october, .november:
            return .autumn
        }
    }
    
    var displayName: String {
        switch self {        case .january:
            return "january"
        case .february:
            return "february"
        case .march:
            return "march"
        case .april:
            return "april"
        case .may:
            return "may"
        case .june:
            return "june"
        case .july:
            return "july"
        case .august:
            return "august"
        case .september:
            return "september"
        case .october:
            return "october"
        case .november:
            return "november"
        case .december:
            return "december"
        }
    }
}
