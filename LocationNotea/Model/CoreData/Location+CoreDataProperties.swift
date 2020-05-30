//
//  Location+CoreDataProperties.swift
//  LocationNotea
//
//  Created by Никита on 22.03.2020.
//  Copyright © 2020 Nikita. All rights reserved.
//
//

import Foundation
import CoreData


extension Location {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Location> {
        return NSFetchRequest<Location>(entityName: "Location")
    }

    @NSManaged public var lat: Double
    @NSManaged public var lon: Double
    @NSManaged public var note: Note?

}
