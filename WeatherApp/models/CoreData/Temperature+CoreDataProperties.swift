//
//  Temperature+CoreDataProperties.swift
//  WeatherApp
//
//  Created by Ihor Golia on 26.10.2022.
//
//

import Foundation
import CoreData


extension Temperature {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Temperature> {
        return NSFetchRequest<Temperature>(entityName: "Temperature")
    }

    @NSManaged public var mounth: Month
    @NSManaged public var celsius: Double
    @NSManaged public var city: City?

}

extension Temperature : Identifiable {

}
