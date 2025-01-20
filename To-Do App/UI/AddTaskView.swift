//
//  AddTaskView.swift
//  To-Do App
//
//  Created by Abdelrahman Mohammed on 12/12/2024.
//

import SwiftUI

struct AddTaskView: View {
    @Environment(\.presentationMode) private var presentationMode
    @ObservedObject var viewModel: TaskViewModel
    
    @State private var title = ""
    @State private var description = ""
    @State private var dueDate = Date()
    @State private var priority: TaskPriority = .medium
    
    private var formSection: some View {
        Section {
            TextField(L10n.titlePlaceholder, text: $title)
            TextField(L10n.descriptionPlaceholder, text: $description)
            DatePicker(L10n.dueDateLabel, selection: $dueDate, displayedComponents: .date)
            Picker(L10n.priorityLabel, selection: $priority) {
                ForEach(TaskPriority.allCases) { priority in
                    Text(priority.rawValue).tag(priority)
                }
            }
        }
    }
    
    private var errorSection: some View {
        Group {
            if let error = viewModel.errorMessage {
                Section {
                    Text(error)
                        .foregroundColor(.red)
                        .font(.caption)
                }
            }
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                formSection
                errorSection
            }
            .navigationTitle(L10n.addTask)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(L10n.cancelButton) {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(L10n.saveButton) {
                        viewModel.addTask(
                            title: title,
                            description: description,
                            dueDate: dueDate,
                            priority: priority.rawValue
                        )
                        if viewModel.errorMessage == nil {
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                    .disabled(title.isEmpty)
                }
            }
        }
    }
}

#Preview {
    AddTaskView(viewModel: TaskViewModel())
}
