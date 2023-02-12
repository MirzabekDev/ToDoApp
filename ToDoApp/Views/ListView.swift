//
//  ListView.swift
//  ToDoApp
//
//  Created by Mirzabek on 08/02/23.
//

import SwiftUI

struct ListView: View {
    /// Connections
    @State var showDetail = false
    @State var dateString = ""
    @ObservedObject var listViewModel = ListViewModel()
    @EnvironmentObject var session : SessionStore

    var body: some View {
        
        NavigationView{
            /// main Vstack
            VStack{
                 
                ZStack{
                    if listViewModel.items.isEmpty{
                        NoItemsView()
                            .transition(AnyTransition.opacity.animation(.easeIn))
                    }else{
                        List{
                            ForEach(listViewModel.items){ item in
                                
                                ListRowView(item: item)
                                    .onTapGesture {
                                        withAnimation(.linear){
                                            listViewModel.updateItem(item: item)
                                        }
                                    }
                            }
                            /// swipe delete item
                            .onDelete(perform: listViewModel.deleteItem)
                            /// cselect move action delete change
                            .onMove(perform: listViewModel.moveItem)
                        }
                        /// Changing the Theme
                        .background(Color("Color1"))
                        .scrollContentBackground(.hidden)
                    }
                }
                
                .navigationTitle("\(dateString)")
              
                .onAppear{
                    dateString = Date.now.formatted(.dateTime.year().month().day())
                }
                //date adding...
                .navigationBarItems(
                    leading: EditButton()
                        .foregroundColor(Color("Color3")).fontWeight(.bold),
                    trailing:
                        
                        Button(action: {
                            showDetail = true
                        }, label: {
                            HStack{
                                Button(action: {
                                    session.signOut()
                                }, label: {
                                    Image(systemName: "pip.exit")
                                        .foregroundColor(Color("Color3"))
                                        .padding()
                                })
                                }
                            Text("Add").foregroundColor(Color("Color3")).fontWeight(.bold)
                            
                        }).sheet(isPresented: $showDetail, content: {
                            AddView { item in
                                listViewModel.items.append(item)
                            }
                        })
                )
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView( listViewModel: ListViewModel())
            
    }
}
