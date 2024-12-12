//
//  PersistenceController.swift
//  To-Do App
//
//  Created by Abdelrahman Mohammed on 12/12/2024.
//

import Foundation
import CoreData
// MARK: - Core Data Persistence
class PersistenceController {
    static let shared = PersistenceController()
    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "ToDoApp")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Unresolved error \(error)")
            }
        }
    }
}
