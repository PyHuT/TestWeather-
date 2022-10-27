//
//  City+CoreDataProperties.swift
//  WeatherApp
//
//  Created by Ihor Golia on 26.10.2022.
//
//

import Foundation
import CoreData


extension City {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<City> {
        return NSFetchRequest<City>(entityName: "City")
    }

    @NSManaged public var size: CitySize
    @NSManaged public var name: String?
    @NSManaged public var temperature: NSSet?

}

// MARK: Generated accessors for temperature
extension City {

    @objc(addTemperatureObject:)
    @NSManaged public func addToTemperature(_ value: Temperature)

    @objc(removeTemperatureObject:)
    @NSManaged public func removeFromTemperature(_ value: Temperature)

    @objc(addTemperature:)
    @NSManaged public func addToTemperature(_ values: NSSet)

    @objc(removeTemperature:)
    @NSManaged public func removeFromTemperature(_ values: NSSet)

}

extension City : Identifiable {

}
