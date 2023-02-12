//
//  AddView.swift
//  ToDoApp
//
//  Created by Mirzabek on 08/02/23.
//

import SwiftUI

struct AddView: View {
    
    ///Connections
    @Environment(\.presentationMode) var presentationMode
    @State private var textTitle: String = ""
    @ObservedObject var listViewModel = ListViewModel()
    @State var alertTitle : String?
    @State var showAlert: Bool = false
    
    init(){
        self.listViewModel = ListViewModel()
    }
    
    init(item: @escaping (itemModel)->()) {
        self.listViewModel = ListViewModel(complete: item)
    }

    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            Text("Create your new task")
                .font(.title2).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
           
            HStack{
                Image(systemName: "square.and.arrow.up.on.square").foregroundColor(Color("Color1"))
                TextField("Enter a task",text: $textTitle)
            }
            .padding()
            .background(Color("Color2")).cornerRadius(20)
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color("Color1"),lineWidth: 4))
            

            Button(action: saveButtonPressed, label: {
                Text("Add task")
                    .foregroundColor(Color("Color2"))
                    .padding()
                    .padding(.horizontal)
                    .background(Color("Color1"))
                    .cornerRadius(30)
            })
            
            Spacer()
            
            Circle().frame(width: 300,height: 300).foregroundColor(Color("Color1"))
                .padding(.bottom,-150).padding(.leading,-150)
        }
        .padding(.top, 40)
        .padding(.horizontal)
        .background(Color("Color2"))
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed(){
        
        if textProof(){
            listViewModel.addItem(title: textTitle)
            presentationMode.wrappedValue.dismiss()
        }
        
    }
    
    func textProof() -> Bool{
        if textTitle.count < 5{
            alertTitle = "The item must contain at least 5 letters"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert{
        return Alert(title: Text(alertTitle!))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
