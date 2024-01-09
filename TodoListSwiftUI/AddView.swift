//
//  AddView.swift
//  TodoListSwiftUI
//
//  Created by Sherif Hamdy on 05/01/2024.
//

import SwiftUI

struct AddView: View {
    @EnvironmentObject var vm:ListViewModel
    @Environment(\.presentationMode) var presentationMode
    @State var title:String = ""
    @State var isShowAlert:Bool = false
    @State var alertMessage:String = ""

    var body: some View {
        ScrollView {
            VStack(spacing: 20.0){
                TextField("Type Something Here...", text:$title)
                    .frame(height: 55)
                    .padding(.horizontal)
                    .background(.gray.opacity(0.3))
                    .cornerRadius(10)
                
                Button {
                    didTapSaveButton()
                } label: {
                    Text("Save".uppercased())
                        .font(.title)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(10)
                }

            }
            .padding()
        }
        .navigationTitle("Add An Item ✒️")
        .alert(isPresented: $isShowAlert) {
            Alert(title: Text(alertMessage))
        }
    }
    
   private func didTapSaveButton(){
       if isTextValid(){
           let item = TodoItem(title: title, isCompleted: false)
           vm.addItem(item: item)
           presentationMode.wrappedValue.dismiss()
       }
    }
    
    private func isTextValid()->Bool{
        guard title.count > 3 else{
            self.isShowAlert = true
            self.alertMessage = "A todo must be more than 3 characters"
            return false
        }
        return true
     }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }        .environmentObject(ListViewModel())

        
    }
}
