//
//  TaskView.swift
//  Project productivity
//
//  Created by Ryan Tan on 11/26/20.
//

import SwiftUI

struct TaskView: View {
    
    @ObservedObject var task_data: TaskData
    
    
    var body: some View {
        Text("Hello, lol!")
            .padding()
    }
    
    
    
    
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView(task_data: TaskData())
    }
}
