//
//  ListView.swift
//  TodoListSwiftUI
//
//  Created by Sherif Hamdy on 05/01/2024.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var vm:ListViewModel
    
    var body: some View {
        ZStack{
            if vm.items.isEmpty{
                EmptyListView()
                    .transition(AnyTransition.opacity.animation(.easeInOut))
            }else{
                List {
                    ForEach(vm.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.easeInOut) {
                                    vm.updateTodo(item: item)
                                }
                            }
                    }
                    .onDelete(perform: vm.deleteItem)
                    .onMove(perform: vm.moveItem)
                }
            }
        }
        .navigationBarItems(leading: EditButton(), trailing: NavigationLink("Add", destination: {
            AddView()
        }))
        .listStyle(.plain)
        .navigationTitle("Todo List 📝")
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}

