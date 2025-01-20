// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Localizable.strings
  ///  To-Do App
  ///  Created by Abdelrahman Mohammed on 20/01/2025.
  internal static let addTask = L10n.tr("Localizable", "add_task", fallback: "Add Task")
  /// Cancel
  internal static let cancelButton = L10n.tr("Localizable", "cancel_button", fallback: "Cancel")
  /// Completed Tasks
  internal static let completedTasks = L10n.tr("Localizable", "completed_tasks", fallback: "Completed Tasks")
  /// Description
  internal static let descriptionPlaceholder = L10n.tr("Localizable", "description_placeholder", fallback: "Description")
  /// Due Date
  internal static let dueDateLabel = L10n.tr("Localizable", "due_date_label", fallback: "Due Date")
  /// Failed to create task
  internal static let errorCreateTask = L10n.tr("Localizable", "error_create_task", fallback: "Failed to create task")
  /// Failed to delete task
  internal static let errorDeleteTask = L10n.tr("Localizable", "error_delete_task", fallback: "Failed to delete task")
  /// Failed to fetch tasks: %@
  internal static func errorFetchTasks(_ p1: Any) -> String {
    return L10n.tr("Localizable", "error_fetch_tasks", String(describing: p1), fallback: "Failed to fetch tasks: %@")
  }
  /// Something went wrong
  internal static let errorGeneric = L10n.tr("Localizable", "error_generic", fallback: "Something went wrong")
  /// Due date must be in the future
  internal static let errorPastDate = L10n.tr("Localizable", "error_past_date", fallback: "Due date must be in the future")
  /// Failed to save task
  internal static let errorSaveTask = L10n.tr("Localizable", "error_save_task", fallback: "Failed to save task")
  /// Title cannot be empty
  internal static let errorTitleEmpty = L10n.tr("Localizable", "error_title_empty", fallback: "Title cannot be empty")
  /// Pending Tasks
  internal static let pendingTasks = L10n.tr("Localizable", "pending_tasks", fallback: "Pending Tasks")
  /// Priority
  internal static let priorityLabel = L10n.tr("Localizable", "priority_label", fallback: "Priority")
  /// Save
  internal static let saveButton = L10n.tr("Localizable", "save_button", fallback: "Save")
  /// Title
  internal static let titlePlaceholder = L10n.tr("Localizable", "title_placeholder", fallback: "Title")
  /// To-Do List
  internal static let todoList = L10n.tr("Localizable", "todo_list", fallback: "To-Do List")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
