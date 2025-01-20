//
//  TaskRow.swift
//  To-Do App
//
//  Created by Abdelrahman Mohammed on 12/12/2024.
//

import SwiftUI
import CoreData

struct TaskRow: View {
    let task: NSManagedObject
    let onComplete: () -> Void
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(task.value(forKey: "title") as? String ?? "")
                    .font(.headline)
                    .strikethrough(task.value(forKey: "isCompleted") as? Bool ?? false)
                
                if let description = task.value(forKey: "taskDescription") as? String {
                    Text(description)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                if let dueDate = task.value(forKey: "dueDate") as? Date {
                    Text(dueDate, style: .date)
                        .font(.caption)
                }
            }
            
            Spacer()
            
            Button(action: onComplete) {
                Image(systemName: (task.value(forKey: "isCompleted") as? Bool ?? false) ? "checkmark.circle.fill" : "circle")
                    .foregroundColor((task.value(forKey: "isCompleted") as? Bool ?? false) ? .green : .gray)
            }
        }
        .padding(.vertical, 8)
    }
}

struct TaskRow_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.preview.container.viewContext
        let task = NSManagedObject(entity: NSEntityDescription.entity(forEntityName: "Task", in: context)!, insertInto: context)
        task.setValue("Sample Task", forKey: "title")
        task.setValue("This is a sample description", forKey: "taskDescription")
        task.setValue(Date(), forKey: "dueDate")
        task.setValue("medium", forKey: "priority")
        task.setValue(false, forKey: "isCompleted")
        
        return List {
            TaskRow(task: task, onComplete: {})
        }
        .environment(\.managedObjectContext, context)
    }
}
