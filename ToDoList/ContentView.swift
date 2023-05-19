//
//  ContentView.swift
//  ToDoList
//
//  Created by scholar on 5/18/23.
//

import SwiftUI

struct ContentView: View {
    @State var toDoItems: [ToDoItem] = [] // to access to do's, we store each to do item in an array of to do item objects
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
                        Text("‼️" + toDoItem.title)
                    } else {
                        Text(toDoItem.title)
                    }
                }
            }
        }
        // show NewToDoView if user wants to create a new task
        if showNewTask {
            NewToDoView(title: "", isImportant: false, toDoItems: $toDoItems, showNewTask: $showNewTask)
                .transition(.move(edge: .bottom))
                
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
