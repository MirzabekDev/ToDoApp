//
//  ListViewModel.swift
//  ToDoApp
//
//  Created by Mirzabek on 09/02/23.
//

import Foundation

class ListViewModel: ObservableObject{
    
    @Published var items : [itemModel] = []{
        
        didSet {
            saveItems()
        }
        
    }
    
    let itemsKey: String = "items_list"
    var complete:((itemModel)->())?

    init() {
        getItems()
    }
    
    init(complete:@escaping (itemModel)->()) {
        getItems()
        self.complete = complete
    }

    // get items
    func getItems(){

        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([itemModel].self, from: data)
        else {return}
        self.items = savedItems
       
    }
    
    //deleting items
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
        
    }
    
    //Moving Item
    func moveItem(from: IndexSet, to : Int){
        items.move(fromOffsets: from, toOffset: to)
       
    }
    
    // Adding Item
    func addItem(title: String){
        let newItem = itemModel(title: title, isComleted: false)
//        items.append(newItem)
        complete?(newItem)
       
    }
    
    // Update list items
    func updateItem(item: itemModel){
        
        if let index = items.firstIndex(where: {$0.id == item.id}){
            items[index] = item.updateCompletion()
           
        }
        
    }
    
    func saveItems(){
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
