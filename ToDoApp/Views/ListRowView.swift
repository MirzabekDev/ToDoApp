//
//  ListRowView.swift
//  ToDoApp
//
//  Created by Mirzabek on 08/02/23.
//

import SwiftUI

struct ListRowView: View {
    /// Connections
    @ObservedObject var listViewModel = ListViewModel()
    let item: itemModel
    
    var body: some View {
        /// row of the each lists
        HStack{
            Image(systemName: item.isComleted ? "checkmark.circle": "circle")
             
                .foregroundColor(item.isComleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = itemModel(title: "First Item", isComleted: false)
    static var item2 = itemModel(title: "Second Item", isComleted: true)
    
    static var previews: some View {
        Group{
            ListRowView(item: item1)
            ListRowView(item: item2)
        }.previewLayout(.sizeThatFits)/// to show the only one list item
    }
}
