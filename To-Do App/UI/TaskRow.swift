//
//  TaskRow.swift
//  To-Do App
//
//  Created by Abdelrahman Mohammed on 12/12/2024.
//

import SwiftUI

// MARK: - TaskRow
struct TaskRow: View {
    let task: TaskModel
    let toggleCompletion: () -> Void

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(task.title)
                    .font(.headline)
                Text(task.description)
                    .font(.subheadline)
                Text("Due: \(task.dueDate, formatter: DateFormatter.shortDate)")
                    .font(.caption)
                Text("Priority: \(task.priority.rawValue)")
                    .font(.caption)
            }
            Spacer()
            Button(action: toggleCompletion) {
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(task.isCompleted ? .green : .gray)
            }
        }
        .padding()
    }
}

// MARK: - Preview
struct TaskRow_Previews: PreviewProvider {
    static var previews: some View {
        TaskRow(
            task: TaskModel(
                title: "Sample Task",
                description: "This is a sample description",
                dueDate: Date(),
                priority: .medium
            ),
            toggleCompletion: {}
        )
    }
}

