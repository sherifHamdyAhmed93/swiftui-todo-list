//
//  ListRowView.swift
//  TodoListSwiftUI
//
//  Created by Sherif Hamdy on 05/01/2024.
//

import SwiftUI

struct ListRowView: View {
    var item : TodoItem
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical,8)
    }
}


struct ListRowView_Previews: PreviewProvider {
    static var item1 = TodoItem(title: "Hello", isCompleted: true)
    static var item2 = TodoItem(title: "Hello", isCompleted: false)

    
    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}
