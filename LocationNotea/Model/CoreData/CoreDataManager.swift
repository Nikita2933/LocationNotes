//
//  CoreDataManager.swift
//  LocationNotea
//
//  Created by Никита on 26.03.2020.
//  Copyright © 2020 Nikita. All rights reserved.
//

import UIKit
import CoreData

var folders: [Folder] {
    let request = NSFetchRequest<Folder>(entityName: "Folder")
    
    let sd = NSSortDescriptor(key: "name", ascending: true)
    request.sortDescriptors = [sd]
    
    let array = try? CoreDataManager.sharedInstance.managedObjectContext.fetch(request)
    
    if array != nil {
        return array!
    }
    
    return []
}


var notes: [Note] {
    let request = NSFetchRequest<Note>(entityName: "Note")
    
    let sd = NSSortDescriptor(key: "dataUpdate", ascending: false)
    request.sortDescriptors = [sd]
    
    let array = try? CoreDataManager.sharedInstance.managedObjectContext.fetch(request)
    
    if array != nil {
        return array!
    }
    
    return []
}


class CoreDataManager  {
    // MARK: - Core Data stack
    
    static let sharedInstance = CoreDataManager()
    
    var managedObjectContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    lazy var persistentContainer: NSPersistentContainer = {
       
        let container = NSPersistentContainer(name: "LocationNotea")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}
