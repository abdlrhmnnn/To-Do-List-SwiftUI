//
//  TaskModel.swift
//  To-Do App
//
//  Created by Abdelrahman Mohammed on 12/12/2024.
//

import Foundation

struct TaskModel: Identifiable {
    var id = UUID()
    var title: String
    var description: String
    var dueDate: Date
    var priority: TaskPriority
    var isCompleted: Bool = false
}
