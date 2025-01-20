import Foundation
import CoreData

class TaskViewModel: ObservableObject {
    @Published var tasks: [NSManagedObject] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let viewContext = PersistenceController.shared.container.viewContext
    
    init() {
        fetchTasks()
    }
    
    func fetchTasks() {
        isLoading = true
        let request = NSFetchRequest<NSManagedObject>(entityName: "Task")
        
        do {
            tasks = try viewContext.fetch(request)
            errorMessage = nil
        } catch {
            errorMessage = "Failed to fetch tasks: \(error.localizedDescription)"
        }
        
        isLoading = false
    }
    
    func addTask(title: String, description: String, dueDate: Date, priority: String) {
        
        guard !title.isEmpty else {
            errorMessage =  L10n.errorTitleEmpty
            return
        }
        
        guard dueDate >= Date() else {
            errorMessage = L10n.errorPastDate
            return
        }
        
        isLoading = true
        
        guard let entity = NSEntityDescription.entity(forEntityName: "Task", in: viewContext) else {
            errorMessage = L10n.errorCreateTask
            isLoading = false
            return
        }
        
        let newTask = NSManagedObject(entity: entity, insertInto: viewContext)
        
        newTask.setValue(UUID(), forKey: "id")
        newTask.setValue(title.trimmingCharacters(in: .whitespacesAndNewlines), forKey: "title")
        newTask.setValue(description.trimmingCharacters(in: .whitespacesAndNewlines), forKey: "taskDescription")
        newTask.setValue(dueDate, forKey: "dueDate")
        newTask.setValue(priority, forKey: "priority")
        newTask.setValue(false, forKey: "isCompleted")
        
        saveContext()
        isLoading = false
    }
    
    func toggleCompletion(_ task: NSManagedObject) {
        isLoading = true
        let isCompleted = task.value(forKey: "isCompleted") as? Bool ?? false
        task.setValue(!isCompleted, forKey: "isCompleted")
        saveContext()
        isLoading = false
    }
    
    func deleteTask(_ task: NSManagedObject) {
        isLoading = true
        viewContext.delete(task)
        saveContext()
        isLoading = false
    }
    
    private func saveContext() {
        do {
            try viewContext.save()
            fetchTasks()
            errorMessage = nil
        } catch {
            errorMessage = L10n.errorSaveTask
        }
    }
}
