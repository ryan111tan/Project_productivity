//
//  Task.swift
//  Project productivity
//
//  Created by Ryan Tan on 11/29/20.
//

import Foundation
import UIKit
import SwiftUI

class Task: Identifiable {
    var id = UUID()
    var image: Image
    var detail: String
    var due_date: Date
    var task_name: String
    
    init(task_name: String, detail: String) {
        self.task_name = task_name
        self.due_date = Date()
        self.image = Image("bookmark")
        self.detail = detail
    }
    
}

class TaskData: ObservableObject {
        @Published var tasks: [Task] =
        [
        
            Task(task_name: "Eat out", detail: "lol"),
            Task(task_name: "Homework 3",  detail: "lol"),
            Task(task_name: "Homework 2",  detail: "lol"),
            Task(task_name: "Homework 1",  detail: "lol"),
            Task(task_name: "Yes",  detail: "lol"),
            Task(task_name: "Homework 3",  detail: "lol"),
            Task(task_name: "Homework 2",  detail: "lol"),
            Task(task_name: "Homework 1",  detail: "lol"),
            Task(task_name: "Yes",  detail: "lol")
        ]
    
    
    func addTask(Task: Task) {
        tasks.append(Task)
    }
    
    func completeTask(cid: UUID) {
        tasks = tasks.filter{ $0.id != cid}
    }
    
}
    
    
    



