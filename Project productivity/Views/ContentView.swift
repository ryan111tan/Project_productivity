//
//  ContentView.swift
//  Project productivity
//
//  Created by Ryan Tan on 11/26/20.
//

import SwiftUI


struct ContentView: View {
    
    @ObservedObject var task_data: TaskData
    var width: CGFloat = UIScreen.main.bounds.width * 0.5
    var height_add: CGFloat = UIScreen.main.bounds.height * 0.1
    var height: CGFloat = UIScreen.main.bounds.height * 0.03
    var body: some View {
        NavigationView{
            VStack{
                
                Spacer()
                
                Text("Daily Tasks")
                    .padding()
                    .font(Font.custom("Montserrat-Bold", size:30.0))
                
                Spacer()
                HStack{
                    Spacer()
                    Button(action: {task_data.sortByDate()}, label: {
                        Text("Sort by Date")
                    })
                    Spacer()
                    Button(action: {task_data.sortByName()}, label: {
                        Text("Sort by Name")
                    })
                    Spacer()
                }
                
                ScrollView(){
                    LazyVStack{
                        ForEach(task_data.tasks, id: \.id) {
                            x in
                            HStack{
                                Spacer().frame(width:30)
                                VStack {
                                    Button(action: {task_data.completeTask(cid: x.id)
                                        
                                    }, label: {
                                        Image(systemName: "checkmark")
                                    }).buttonStyle(Compelete()).animation(.easeInOut(duration: 0.5))
                                    
                                    
                                }.frame(width: 50, alignment: .center)
                                
                                Spacer()
                                
                                NavigationLink(
                                    destination: TaskView(task: x, task_data: task_data)
                                        ,
                                    label: { Text(x.task_name)
                                        .frame(width: width, height:height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        .padding()
                                        .background(Color.backgroundGreen)
                                        .overlay(
                                                RoundedRectangle(cornerRadius: 15)
                                                .stroke(lineWidth: 2)
                                            )
                                        .buttonStyle(Compelete()).animation(.easeInOut(duration: 0.5))
                                        

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
                    Text("New Task")
                        .frame(width: width ,height: height_add)
                        .background(Color.backgroundBlue)
                        .cornerRadius(60)
                        .foregroundColor(.black)
                        
                    })
                Spacer()
            }
            
            .navigationBarHidden(true)
            .background(Color.backgroundOrange)
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(task_data: TaskData())
    }
}


struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }

}



extension Color {
    static let backgroundGreen: Color = Color(red: 209/255, green: 252/255, blue: 201/255)
    static let backgroundOrange: Color = Color(red: 253/255, green: 238/255, blue: 211/255)
    static let backgroundBlue: Color = Color(red: 202/255, green: 250/255, blue: 250/255)
    static let backgroundPink: Color = Color(red: 248/255, green: 175/255, blue: 175/255)
    static let backgroundGray: Color = Color(red: 221/255, green: 204/255, blue: 204/255)
}

struct Compelete: ButtonStyle {

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            .background(Color.backgroundGreen)
            .cornerRadius(40)
            .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.blue, lineWidth: 2)
                    )
    }
}

struct CustomTextField: TextFieldStyle {
    var width: CGFloat = UIScreen.main.bounds.width * 0.5
    var height_add: CGFloat = UIScreen.main.bounds.height * 0.1
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .frame(width: width ,height: height_add)
            .background(Color.backgroundBlue)
            .cornerRadius(60)
            .foregroundColor(.black)
    }
}

