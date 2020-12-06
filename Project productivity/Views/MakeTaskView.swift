//
//  MakeTaskView.swift
//  Project productivity
//
//  Created by Ryan Tan on 11/26/20.
//

import SwiftUI


struct MakeTaskView: View {
    
    @ObservedObject var task_data: TaskData
    @State var task_name: String = ""
    @State var detail: String = ""
    @State var due_date: Date = Date()
    @State private var empty_task: Bool = false
   
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    
    
    var body: some View {
        
        VStack{
            
            
            Text("Task Name")
            
            HStack{
            
            TextField("Task Name", text: $task_name)
                .background(Color.gray)
            }
            
            Spacer()
            
            Text("Detail")
            
            HStack{
            TextField("detail", text: $detail)
                .background(Color.gray)
            }
            
            Spacer()
            
            HStack{
                
                DatePicker("Select a due date",selection: $due_date, in: Date()...)
                
            Spacer()
            }
            
            Spacer()
            
            Button(action: {
                
                
                if(task_name != "") {
                
                task_data.addTask(Task: Task(task_name: task_name, detail: detail));
                presentationMode.wrappedValue.dismiss()
                } else {
                    
                empty_task = true
                }
                
                
            },
                label: {
                Text("Button")
            })
            .alert(isPresented: $empty_task, content: {
                Alert(title: Text("Empty Task Name"))
            })
            
            
           
        }
        
    }
    
    
}

struct MakeTaskView_Previews: PreviewProvider {
    static var previews: some View {
        MakeTaskView(task_data: TaskData())
    }
}
