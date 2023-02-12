//
//  NoItemsView.swift
//  ToDoApp
//
//  Created by Mirzabek on 11/02/23.
//

import SwiftUI

struct NoItemsView: View {
    
    /// Connections
    @State var animate: Bool = false
    let Color1 = Color("Color1")
    
    var body: some View {
        
        NavigationView{
           
            ScrollView{
                /// main Vstack
                VStack(spacing: 10){
                    
                    Text("There isn't any tasks")
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    Text(" You can put your daily tasks here by clicking the add button located right bottom")
                        .padding(.bottom,20)
                 
                        HStack{
                            Text("Add something")
                                .foregroundColor(Color("Color2"))
                                .font(.headline)
                                .frame(height: 55)
                                .frame(maxWidth: .infinity)
                                .background(animate ? Color1: Color.accentColor.opacity(0.7))
                                .cornerRadius(10)
                        }
                    
                    .padding(.horizontal, animate ? 30 : 50 )
                    
                    HStack{
                        Text("Add your tasks and achieve your goals")
                            .fontWeight(.semibold).padding()
                    }
                    /// shadow for the action
                    .shadow(
                        color: animate ? Color1 : Color.accentColor.opacity(0.7),
                        radius: animate ? 30 : 10,
                        x: 0,
                        y: animate ? 50: 30)
                    .scaleEffect(animate ? 1.1 : 1.0)
                    .offset(y: animate ? -7 : 0)
                    
                }
                .frame(maxWidth: 400)
                .multilineTextAlignment(.center)
                .padding(40)
                .onAppear(perform: addAnimation)
                .padding()
               
                
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .background(Color("Color2"))// background
        
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
  /// animation function
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NoItemsView()
    }
}
