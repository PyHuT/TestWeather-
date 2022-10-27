//
//  CityStore.swift
//  WeatherApp
//
//  Created by Ihor Golia on 27.10.2022.
//

import Foundation

class CityStore: ObservableObject {
    @Published var cities: [City]
    
    static let shared = CityStore()
    
    private let controller =  PersistenceController()
    private init() {
        let items = try! controller.container.viewContext.fetch(City.fetchRequest())
        cities = items
  
    }
    
    func update() {
       cities = try! controller.container.viewContext.fetch(City.fetchRequest())
    }
    
    func save() {
        try? controller.container.viewContext.save()
        update()
        
    }
}



