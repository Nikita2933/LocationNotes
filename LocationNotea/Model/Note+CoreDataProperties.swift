//
//  Note+CoreDataProperties.swift
//  LocationNotea
//
//  Created by Никита on 22.03.2020.
//  Copyright © 2020 Nikita. All rights reserved.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var name: String?
    @NSManaged public var textDescription: String?
    @NSManaged public var imageSmall: Data?
    @NSManaged public var dataUpdate: Date?
    @NSManaged public var folder: Folder?
    @NSManaged public var location: Location?
    @NSManaged public var image: ImageNote?

}
