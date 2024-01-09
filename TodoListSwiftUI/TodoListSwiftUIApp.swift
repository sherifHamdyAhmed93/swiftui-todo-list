//
//  TodoListSwiftUIApp.swift
//  TodoListSwiftUI
//
//  Created by Sherif Hamdy on 05/01/2024.
//

import SwiftUI

@main
struct TodoListSwiftUIApp: App {
    
    @StateObject var vm = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(vm)
        }
    }
}
