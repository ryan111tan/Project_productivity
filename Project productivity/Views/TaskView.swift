//
//  TaskView.swift
//  Project productivity
//
//  Created by Ryan Tan on 11/26/20.
//

import SwiftUI

struct TaskView: View {
    
    var task: Task
    
    
    var body: some View {
        VStack{
            
            Spacer()
            
            HStack{
                Text(task.task_name)
            }
            
            HStack{
                Text(task.due_date, style: .date)
            }
            
            Spacer()
            
            HStack{
                VStack{
                    Text("Details")
                    Text(task.detail)
                }
                
            }
            Spacer()
            
            
        }
    }
    
    
    
    
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView(task:  Task(task_name: "Eat out", detail: "lol", due_date: Date()))
    }
}
