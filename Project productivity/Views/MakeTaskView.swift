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
    @State private var name_too_long: Bool = false
   

    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    
    
    var body: some View {
        
        VStack{
            
            Spacer()
            
            Text("Task Name")
            
            HStack{
            
            TextField("Task Name", text: $task_name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
            }.padding()
            
            Spacer()
            
            Text("Detail")
            
            HStack{
            TextField("detail", text: $detail)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            }.padding()
            Spacer()
            
            HStack{
                
                Text("Due Date")
                Spacer()
                DatePicker("",selection: $due_date,
                           in: due_date...)
                
            Spacer()
            }.padding()
            
                    
            Button(action: {
                
                if(task_name != "") {
                
                task_data.addTask(Task: Task(task_name: task_name, detail: detail));
                presentationMode.wrappedValue.dismiss()
                } else {
                    
                empty_task = true
                }
                
                
                
                
                
                
                
            },
                label: {
                Text("Done")
            })
            .padding()
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            .background(Color.backgroundGray)
            .cornerRadius(40)
            .alert(isPresented: $empty_task, content: {
                Alert(title: Text("Empty Task Name"))
            })
            .offset(y: 35)
            
            Spacer()
            
        }.background(Color.backgroundOrange)
        .navigationBarTitle(Text("New Task")                    .font(.title), displayMode: .inline)         
        

        
       
        
    }
    


}
    
    



struct MakeTaskView_Previews: PreviewProvider {
    static var previews: some View {
        MakeTaskView(task_data: TaskData())
    }
}
