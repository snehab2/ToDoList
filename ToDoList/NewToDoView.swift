//
//  NewToDoView.swift
//  ToDoList
//
//  Created by scholar on 5/18/23.
//

import SwiftUI

struct NewToDoView: View {
    @Environment(\.managedObjectContext) var context
    
    // data we're going to keep track of
    @State var title: String
    @State var isImportant: Bool
    
    // create a two way connection between this file and ContentView
    //@Binding var toDoItems: [ToDoItem]
    @Binding var showNewTask : Bool
    
    var body: some View {
        VStack {
            Text("Add a new task")
                .font(.title)
                .fontWeight(.bold)
            TextField("Enter the task description", text: $title)
                .padding()
                .background(Color(.systemGroupedBackground))
                .cornerRadius(15)
                .padding()
            // toggle
            Toggle(isOn: $isImportant) {
                Text("Is it important?")
            }
            .padding()
            // button
            Button(action: {
                // function call
                self.addTask(title: self.title, isImportant: self.isImportant)
                self.showNewTask = false
            }) {
                Text("Add")
            }
            .padding()
            .background(Color(.systemGroupedBackground))
            .cornerRadius(15)
            .padding()
        }
    }
    
    // function to create to do objects
    private func addTask(title: String, isImportant: Bool = false) {
        // create new ToDoItem object
        //let task = ToDoItem(title: title, isImportant: isImportant) // call initializer
        // add object to array
        //toDoItems.append(task)
        
        let task = ToDo(context: context)
        task.id = UUID()
        task.title = title
        task.isImportant = isImportant
                
        do {
                    try context.save()
        } catch {
                    print(error)
        }
    }
}

struct NewToDoView_Previews: PreviewProvider {
    static var previews: some View {
        // if no values are specified for both properties, provide default values
        NewToDoView(title: "", isImportant: false, showNewTask: .constant(true))
    }
}
