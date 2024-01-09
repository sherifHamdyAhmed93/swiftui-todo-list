//
//  ListViewModel.swift
//  TodoListSwiftUI
//
//  Created by Sherif Hamdy on 05/01/2024.
//

import Foundation

class ListViewModel:ObservableObject{
    @Published var items:[TodoItem] = [] {
        didSet{
            saveItems()
        }
    }
    
    private let ItemsSavedkey = "SavedItems"
    
    init(){
        getItems()
    }
    
    private func getItems(){
        guard let data = UserDefaults.standard.data(forKey: ItemsSavedkey),
              let items = try? JSONDecoder().decode([TodoItem].self, from: data) else{
            return
        }
        self.items = items
    }
    
    func deleteItem(indexSet:IndexSet){
        self.items.remove(atOffsets: indexSet)
    }
    
    func moveItem(indexSet:IndexSet,newIndex:Int){
        self.items.move(fromOffsets: indexSet, toOffset: newIndex)
    }
    
    func updateTodo(item:TodoItem){
        guard let itemIndex = self.items.firstIndex(where: {$0.id == item.id }) else{
            return
        }
        
        self.items[itemIndex] = item.completeItem()
        
    }
    
    func addItem(item:TodoItem){
        self.items.append(item)
    }
    
    private func saveItems(){
        if let savedItems = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(savedItems, forKey: ItemsSavedkey)
        }
    }
    
}
