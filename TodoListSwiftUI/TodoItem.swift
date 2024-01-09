//
//  TodoItem.swift
//  TodoListSwiftUI
//
//  Created by Sherif Hamdy on 05/01/2024.
//

import Foundation

struct TodoItem:Identifiable,Codable{
    let id:String
    let title:String
    let isCompleted:Bool
    
    
    init(id:String = UUID().uuidString ,title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func completeItem()->TodoItem{
        return TodoItem(id: id, title: title, isCompleted: !isCompleted)
    }
    
}
