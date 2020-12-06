//
//  EditTaskView.swift
//  Project productivity
//
//  Created by Ryan Tan on 12/6/20.
//

import SwiftUI

struct EditTaskView: View {
    
    @State var task: Task
    @State var  newName: String = ""
    @State var newDate: Date = Date()
    @State var newDetail: String = ""
    
    
    var body: some View {
        
        VStack{
            HStack{
                VStack{
                    Text("Change Name")
                    TextField(task.task_name, text: $newName)
                }
            }
            Spacer()
            
            HStack{
                VStack{
                    Text("Change Detail")
                    TextField(task.detail, text: $newDetail)
                }
            }
            
            Spacer()
            
            HStack{
                VStack{
                    Text("Change Date")
                    DatePicker("Select a due date",selection: $newDate, in: Date()...)
                }
            }
        }
        
    }
    
    
    
}
