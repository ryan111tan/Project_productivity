//
//  TaskView.swift
//  Project productivity
//
//  Created by Ryan Tan on 11/26/20.
//

import SwiftUI

struct TaskView: View {
    
    @State var task: Task
    @State var editTask: Bool = false
    @ObservedObject var task_data: TaskData
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    
    var body: some View {
        
     
            
            
            VStack{
                
                
                HStack{
                    Text(task.due_date, style: .date)
                }.padding()
                
                Spacer()
                
                HStack{
                    VStack{
                        Text(task.detail).textFieldStyle(CustomTextField())
                    }
                    
                }.padding()
                .offset(y: -50)
                Spacer()

                
                NavigationLink(
                    destination: EditTaskView(task: task, newName: task.task_name, newDate:task.due_date, newDetail: task.detail, task_data: task_data),
                    isActive: $editTask,
                    label: {})
                
                
            }
            .frame(width: UIScreen.main.bounds.width)
            .navigationBarTitle(Text(task.task_name)                    .font(.title), displayMode: .inline)
            
            .toolbar(content: {
            ToolbarItem(){
                Button(action: {self.editTask = true;}, label: {
                            Text("Edit")
                        })
                    }
            })
            
            
            .background(Color.backgroundOrange)

        
        

        
    }
    
    
    
}
    


struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView(task:  Task(task_name: "Eat out", detail: "lol", due_date: Date(timeIntervalSinceNow: 100000)), task_data: TaskData())
    }
}

