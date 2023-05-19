//
//  ToDoItem.swift
//  ToDoList
//
//  Created by scholar on 5/18/23.
//

import Foundation
class ToDoItem: Identifiable {
    // properties
    var title = ""
    var isImportant = false
    var id = UUID() // generates a random identifier; helps us iterate over each element in class
    
    // initializer
    init(title: String, isImportant: Bool = false) {
        self.title = title
        self.isImportant = isImportant
    }
}
