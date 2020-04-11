//
//  Folder+CoreDataClass.swift
//  LocationNotea
//
//  Created by Никита on 22.03.2020.
//  Copyright © 2020 Nikita. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Folder)
public class Folder: NSManagedObject {
    
    class func newFolder (name: String) -> Folder {
     let folder = Folder(context: CoreDataManager.sharedInstance.managedObjectContext)
        
        folder.name = name
        folder.dataUpdate = Date()
        
        return folder
    }
    
    func addNote() -> Note {
        let newNote = Note(context: CoreDataManager.sharedInstance.managedObjectContext)
        
        newNote.folder = self
        newNote.dataUpdate = Date()
        
        return newNote
    }
    
    var notesSorted: [Note] {
        let sortDescriptor = NSSortDescriptor(key: "dataUpdate", ascending: false)
        return self.notes?.sortedArray(using: [sortDescriptor]) as! [Note]
        
    }
    
}
