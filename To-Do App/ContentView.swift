//
//  ContentView.swift
//  To-Do App
//
//  Created by Abdelrahman Mohammed on 12/12/2024.
//

import SwiftUI
import CoreData


// MARK: - ContentView
struct ContentView: View {
    @StateObject private var viewModel = TaskViewModel()
    @State private var showAddTaskView = false

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Pending Tasks")) {
                    ForEach(viewModel.tasks.filter { !$0.isCompleted }) { task in
                        TaskRow(task: task, toggleCompletion: {
                            viewModel.toggleTaskCompletion(task: task)
                        })
                    }
                    .onDelete(perform: viewModel.deleteTask)
                }

                Section(header: Text("Completed Tasks")) {
                    ForEach(viewModel.tasks.filter { $0.isCompleted }) { task in
                        TaskRow(task: task, toggleCompletion: {
                            viewModel.toggleTaskCompletion(task: task)
                        })
                    }
                    .onDelete(perform: viewModel.deleteTask)
                }
            }
            .navigationTitle("To-Do List")
            .toolbar {
                Button(action: { showAddTaskView.toggle() }) {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showAddTaskView) {
                AddTaskView(viewModel: viewModel)
            }
        }
    }
}

#Preview {
    ContentView()
}
