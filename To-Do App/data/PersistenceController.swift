//
//  PersistenceController.swift
//  To-Do App
//
//  Created by Abdelrahman Mohammed on 12/12/2024.
//

import CoreData

class PersistenceController {
    static let shared = PersistenceController()
    static let preview: PersistenceController = {
        let controller = PersistenceController(inMemory: true)
        return controller
    }()
    
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        // Updated to match actual .xcdatamodeld file name
        container = NSPersistentContainer(name: "CoreDataModel")
        
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("CoreData failed to load: \(error.localizedDescription)")
            }
        }
    }
}
