//
//  TaskViewModel.swift
//  To-Do App
//
//  Created by Abdelrahman Mohammed on 12/12/2024.
//

import Foundation
// MARK: - ViewModel
class TaskViewModel: ObservableObject {
    @Published var tasks: [TaskModel] = []

    func addTask(title: String, description: String, dueDate: Date, priority: TaskPriority) {
        let newTask = TaskModel(title: title, description: description, dueDate: dueDate, priority: priority)
        tasks.append(newTask)
    }

    func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }

    func toggleTaskCompletion(task: TaskModel) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
        }
    }
}
