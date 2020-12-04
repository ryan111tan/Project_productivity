//
//  MakeTaskView.swift
//  Project productivity
//
//  Created by Ryan Tan on 11/26/20.
//

import SwiftUI


struct MakeTaskView: View {
    
    @ObservedObject var task_data: TaskData
    @State var task_name: String = " "
    @State var detail: String = " "
    @State var due_date: Date? = nil
    @State var image: Image? = nil
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    
    
    var body: some View {
        
        VStack{
            Text("Detail")
            TextField("detail", text: $detail)
                .background(Color.gray)
            
            Spacer()
            
            Text("Task Name")
            TextField("Task Name", text: $task_name)
                .background(Color.gray)
            Spacer()
            
            
            Button(action: {task_data.addTask(Task: Task(task_name: task_name, detail: detail));
                presentationMode.wrappedValue.dismiss()
            },
                label: {
                Text("Button")
            })
            
            Spacer()
            
           
        }
        
    }
    
    
}

struct MakeTaskView_Previews: PreviewProvider {
    static var previews: some View {
        MakeTaskView(task_data: TaskData())
    }
}
