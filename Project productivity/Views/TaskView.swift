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
        
        NavigationView{
            
            
            
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
                
                HStack{
                    Button(action: {presentationMode.wrappedValue.dismiss()}, label: {
                        Text("Home")
                    })
                }
                
                NavigationLink(
                    destination: EditTaskView(task: task, newName: task.task_name, newDate:task.due_date, newDetail: task.detail, task_data: task_data),
                    isActive: $editTask,
                    label: {})
                
            }
            .padding(.horizontal)
            .toolbar(content: {
            ToolbarItem(){
                Button(action: {self.editTask = true;}, label: {
                            Text("Edit")
                        })
                    }
            })
            
        }.navigationBarHidden(true)
        
        
        
    }
    
    
    
}
    

//
//struct TaskView_Previews: PreviewProvider {
//    static var previews: some View {
//        TaskView(task:  Task(task_name: "Eat out", detail: "lol", due_date: Date(timeIntervalSinceNow: 100000)))
//    }
//}
