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
                Text("To Do List")
                        .padding()
                
            ScrollView(){
                LazyVStack{
                    ForEach(task_data.tasks, id: \.id) {
                        x in
                        HStack{
                            Button(action: {task_data.completeTask(cid: x.id)}, label: {
                                Text("Complete")
                            })
                        Spacer()
                            Text(x.task_name)
                                .padding()
                        }
                    
                        }
                    Spacer()
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

        }
        .navigationViewStyle(DefaultNavigationViewStyle())
    }
    
    
}







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(task_data: TaskData())
    }
}

