//
//  ItemModel.swift
//  ToDoApp
//
//  Created by Mirzabek on 09/02/23.
//

import Foundation


// Immutable struct

struct itemModel: Identifiable, Codable{
    
    let id: String
    var title: String
    let isComleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isComleted: Bool) {
        
        self.id = UUID().uuidString
        self.title = title
        self.isComleted = isComleted
    }
    
    func updateCompletion() -> itemModel{
        return itemModel(id: id, title: title, isComleted: !isComleted)
    }
}


