//
//  ToDoItem.swift
//  ToDoList
//
//  Created by scholar on 5/18/23.
//

import Foundation
class ToDoItem {
    // properties
    var title = ""
    var isImportant = false
    
    // initializer
    init(title: String, isImportant: Bool = false) {
        self.title = title
        self.isImportant = isImportant
    }
}
