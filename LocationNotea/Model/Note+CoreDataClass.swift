//
//  Note+CoreDataClass.swift
//  LocationNotea
//
//  Created by Никита on 22.03.2020.
//  Copyright © 2020 Nikita. All rights reserved.
//
//

import Foundation
import CoreData
import UIKit

@objc(Note)
public class Note: NSManagedObject {
    
    class func newNote (name: String, inFolder: Folder?) -> Note {
        let note = Note(context: CoreDataManager.sharedInstance.managedObjectContext)
        
        note.name = name
        note.dataUpdate = Date()
        
        if let inFolder = inFolder {
            note.folder = inFolder
        }
        
        return note
    }
    
    
    func addImage (image: UIImage) {
       let imageNote = ImageNote(context: CoreDataManager.sharedInstance.managedObjectContext)
        
        imageNote.imageBig = image.jpegData(compressionQuality: 1)
        self.image = imageNote
    }
    
    
    func addLocation (latitude: Double, lontitude: Double) {
        let location = Location(context: CoreDataManager.sharedInstance.managedObjectContext)
        
        location.lat = latitude
        location.lon = lontitude
        
        self.location = location
    }
    
    var dataUpdateString: String {
        let df = DateFormatter()
        df.dateStyle = .medium
        df.timeStyle = .short
        
        return df.string(from: self.dataUpdate!)
    }
    
}
