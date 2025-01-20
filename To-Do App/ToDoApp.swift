//
//  To_Do_AppApp.swift
//  To-Do App
//
//  Created by Abdelrahman Mohammed on 12/12/2024.
//

import SwiftUI
import CoreData

@main
struct ToDoApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}


struct ToDoApp_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
