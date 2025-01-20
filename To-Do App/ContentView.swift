//
//  ContentView.swift
//  To-Do App
//
//  Created by Abdelrahman Mohammed on 12/12/2024.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @StateObject private var viewModel = TaskViewModel()
    @State private var showAddTaskView = false
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text(L10n.pendingTasks)) {
                    ForEach(viewModel.tasks.filter { task in
                        let isCompleted = task.value(forKey: "isCompleted") as? Bool ?? false
                        return !isCompleted
                    }, id: \.self) { task in
                        TaskRow(task: task) {
                            viewModel.toggleCompletion(task)
                        }
                    }
                    .onDelete { indexSet in
                        indexSet.forEach { index in
                            viewModel.deleteTask(viewModel.tasks[index])
                        }
                    }
                }
                
                Section(header: Text(L10n.completedTasks)) {
                    ForEach(viewModel.tasks.filter { task in
                        let isCompleted = task.value(forKey: "isCompleted") as? Bool ?? false
                        return isCompleted
                    }, id: \.self) { task in
                        TaskRow(task: task) {
                            viewModel.toggleCompletion(task)
                        }
                    }
                    .onDelete { indexSet in
                        indexSet.forEach { index in
                            viewModel.deleteTask(viewModel.tasks[index])
                        }
                    }
                }
            }
            .navigationTitle(L10n.addTask)
            .toolbar {
                Button(action: { showAddTaskView.toggle() }) {
                    Image(systemName: "plus")
                }
                .accessibilityLabel(Text(L10n.addTask))
            }
            .sheet(isPresented: $showAddTaskView) {
                AddTaskView(viewModel: viewModel)
            }
        }
    }
}

#Preview {
    ContentView()
        .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
}
