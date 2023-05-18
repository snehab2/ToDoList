//
//  NewToDoView.swift
//  ToDoList
//
//  Created by scholar on 5/18/23.
//

import SwiftUI

struct NewToDoView: View {
    // data we're going to keep track of
    @State var title: String
    @State var isImportant: Bool
    
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
              
            }) {
                Text("Add")
            }
            .padding()
            .background(Color(.systemGroupedBackground))
            .cornerRadius(15)
            .padding()
            
            
        }
    }
}

struct NewToDoView_Previews: PreviewProvider {
    static var previews: some View {
        // if no values are specified for both properties, provide default values
        NewToDoView(title: "", isImportant: false)
    }
}
