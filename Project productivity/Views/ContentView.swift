//
//  ContentView.swift
//  Project productivity
//
//  Created by Ryan Tan on 11/26/20.
//

import SwiftUI




struct ContentView: View {
    
    @ObservedObject var task_data: TaskData
    
    
    var body: some View {
        
        NavigationView{
            VStack{

               
                HStack{
                    Button(action: {task_data.sortByDate()}, label: {
                        Text("Sort by Date")
                    })
                    Button(action: {task_data.sortByName()}, label: {
                        Text("Sort by Name")
                    })
                    
                }
                
            ScrollView(){
                LazyVStack{
                    ForEach(task_data.tasks, id: \.id) {
                        x in
                        HStack{
                            Spacer()
                            
                            VStack {
                                
                                Button(action: {task_data.completeTask(cid: x.id)}, label: {
                                    Image(systemName: "checkmark")
                                })
                            }
                            
                        Spacer()
                
                            NavigationLink(
                                destination: TaskView(task: x),
                                label: { Text(x.task_name)
                                            .padding()
                                })
    
                        Spacer()
                        }
                    
                        }
                }
            }
                Spacer()
            
            NavigationLink(
                destination: MakeTaskView(task_data: task_data),
                label: {
                    Text("Make Task")
                })
            
            Spacer()
            }
            .navigationBarHidden(true)
            
        }
       
        
        
        
        
        
        
    }
    
    
}







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(task_data: TaskData())
    }
}

