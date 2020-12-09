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
    @State private var empty_name: Bool = false
    @ObservedObject var task_data: TaskData
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        VStack{
            HStack{
                VStack{
                    Text("Name Change")
                    TextField(task.task_name, text: $newName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }.padding()
            }
            Spacer()
            
            HStack{
                VStack{
                    Text("Detail Change")
                    TextField(task.detail, text: $newDetail)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }.padding()
            
            }
            
            Spacer()
            
           
                VStack{
                    Text("Date Change")
                    DatePicker("",selection: $newDate,in: Date()...).padding(.trailing).offset(x:-20)
                    
                }.padding()
            
            Spacer()
            
            HStack{
                Button(action: {
                    
                    if(newName != "") {
                    self.task.changeDate(date: newDate);
                    self.task.changeDetail(detail: newDetail);
                    self.task.changeName(name: newName);
                    self.task_data.sortByDate();
                    presentationMode.wrappedValue.dismiss();
                    } else {
                        empty_name = true
                    }
                }, label: {
                    Text("Confirm")
                })
                .alert(isPresented: $empty_name, content: {
                    Alert(title: Text("Empty Task Name"))
                })
                
            }
            .padding()
        }
        .background(Color.backgroundOrange)
        .navigationBarTitle(Text("Edit Task")                    .font(.title), displayMode: .inline)
    }
    
    
    
}


struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditTaskView(task:  Task(task_name: "Eat out", detail: "lol", due_date: Date()),
                     newName: Task(task_name: "Eat out", detail: "lol", due_date: Date()).task_name,
                     newDate: Task(task_name: "Eat out", detail: "lol", due_date: Date()).due_date,
                     newDetail: Task(task_name: "Eat out", detail: "lol", due_date: Date()).detail, task_data: TaskData()
                     )
    }
}

