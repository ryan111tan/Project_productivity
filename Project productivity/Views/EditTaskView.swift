//
//  EditTaskView.swift
//  Project productivity
//
//  Created by Ryan Tan on 12/6/20.
//

import SwiftUI

struct EditTaskView: View {
    
    
    @State var task: Task
    @State var  newName: String
    @State var newDate: Date = Date()
    @State var newDetail: String
    @ObservedObject var task_data: TaskData
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
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
                    DatePicker("Select a due date",selection: $newDate,in: Date()...)
                }
            }
            Spacer()
            
            HStack{
                Button(action: {
                    self.task.changeDate(date: newDate);
                    self.task.changeDetail(detail: newDetail);
                    self.task.changeName(name: newName);
                    self.task_data.sortByDate();
                    presentationMode.wrappedValue.dismiss();
                }, label: {
                    Text("Confirm")
                })
            }
        }
        
    }
    
    
    
}


//struct EditView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditTaskView(task:  Task(task_name: "Eat out", detail: "lol", due_date: Date()),
//                     newName: Task(task_name: "Eat out", detail: "lol", due_date: Date()).task_name,
//                     newDate: Task(task_name: "Eat out", detail: "lol", due_date: Date()).due_date,
//                     newDetail: Task(task_name: "Eat out", detail: "lol", due_date: Date()).detail
//                     )
//    }
//}
//
