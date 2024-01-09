//
//  EmptyListView.swift
//  TodoListSwiftUI
//
//  Created by Sherif Hamdy on 06/01/2024.
//

import SwiftUI

struct EmptyListView: View {
    @State var isAnimated = false
    let secondaryColor = Color("secondary_color")
    var body: some View {
        ScrollView {
            VStack(spacing: 10.0){
                Text("There are no items")
                    .font(.title)
                    .fontWeight(.bold)
                Text("Are you a productive person? i think you should click the add button and add a banch of items to your todo list!")
                    .padding(.bottom,20)
                
                NavigationLink {
                    AddView()
                } label: {
                    Text("Add Something 🥳")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(isAnimated ? secondaryColor : .accentColor)
                        .cornerRadius(10)
                }
                .padding(.horizontal,isAnimated ? 30 : 50)
                .shadow(color: isAnimated ? secondaryColor.opacity(0.5) : .accentColor.opacity(0.5), radius: isAnimated ? 30 : 10, x: 0, y: isAnimated ? 50 : 30)
                .scaleEffect(isAnimated ? 1.1 : 1)
                .offset(y:isAnimated ? -7 : 0)


            }
            .padding(40)
            .multilineTextAlignment(.center)
            .onAppear {
                addAnimation()
            }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        }
        
    }
    
    func addAnimation(){
        guard !isAnimated else{return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            withAnimation(.easeInOut.repeatForever()) {
                self.isAnimated.toggle()
            }
        })
    }
    
}

struct EmptyListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EmptyListView()
                .navigationTitle("title")
        }
    }
}
