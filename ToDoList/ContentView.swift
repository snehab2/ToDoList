//
//  ContentView.swift
//  ToDoList
//
//  Created by scholar on 5/18/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var context
    //@State var toDoItems: [ToDoItem] = [] // to access to do's, we store each to do item in an array of to do item objects
    
    // fetch to do items from core data
    @FetchRequest(
            entity: ToDo.entity(), sortDescriptors: [ NSSortDescriptor(keyPath: \ToDo.id, ascending: false) ])
        
    var toDoItems: FetchedResults<ToDo>
    
    @State private var showNewTask = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Grind Time 💪")
                    .font(.system(size: 40))
                    .fontWeight(.black)
                Spacer()
                Button(action: {
                    // set to true if user wants to create a new task
                    withAnimation(.easeIn(duration:0.5)) {
                        //self.showNewTask = true
                        self.showNewTask.toggle()
                    }
                }) {
                    Text("+")
                        .font(.system(size: 40))
                }
                
            }
            .padding()
            Spacer()
            
            List {
                ForEach(toDoItems) { toDoItem in
                    if toDoItem.isImportant == true {
                        Text("‼️" + (toDoItem.title ?? "No title"))
                    } else {
                        Text(toDoItem.title ?? "No title")
                    }
                }
                .onDelete(perform: deleteTask)
            }
        }
        // show NewToDoView if user wants to create a new task
        if showNewTask {
            NewToDoView(title: "", isImportant: false, showNewTask: $showNewTask)
                .transition(.move(edge: .bottom))
                
        }
        
    }
    
    private func deleteTask(offsets: IndexSet) {
        withAnimation {
            offsets.map { toDoItems[$0] }.forEach(context.delete)

            do {
                try context.save()
            } catch {
                    print(error)
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
