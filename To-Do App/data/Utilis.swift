//
//  Utilis.swift
//  To-Do App
//
//  Created by Abdelrahman Mohammed on 12/12/2024.
//

import Foundation
// MARK: - DateFormatter Extension
extension DateFormatter {
    static var shortDate: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }
}
