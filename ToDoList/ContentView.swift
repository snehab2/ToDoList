//
//  ContentView.swift
//  ToDoList
//
//  Created by scholar on 5/18/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Grind Time 💪")
                    .font(.system(size: 40))
                    .fontWeight(.black)
                Spacer()
                Button(action: {
                    
                }) {
                    Text("+")
                        .font(.system(size: 40))
                }
                
            }
            .padding()
            Spacer()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
