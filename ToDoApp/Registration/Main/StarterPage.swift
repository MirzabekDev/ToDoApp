//
//  StarterPage.swift
//  ToDoApp
//
//  Created by Mirzabek on 07/02/23.
//
import SwiftUI

struct StarterPage: View {
    /// Connections
    @EnvironmentObject var session: SessionStore
    
    var body: some View {
        /// if issue that make pages
        VStack{
            if session.session != nil{
                ListView(listViewModel: ListViewModel())
            }else{
                openPage()
            }
        }
        .onAppear{
            session.listen()
        }
        
    }
}

struct StarterScreen_Previews: PreviewProvider {
    static var previews: some View {
        StarterPage()
    }
}
