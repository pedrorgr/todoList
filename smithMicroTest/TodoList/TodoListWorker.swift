//
//  TodoListWorker.swift
//  smithMicroTest
//
//  Created by catiavidinhas on 23/09/18.
//  Copyright © 2018 pedroribeiro. All rights reserved.
//

import UIKit

class TodoListWorker {

    func fetchTodoList(userId:String, completionBlock:@escaping ([Item]) -> ()) {
        
        FirebaseManager.itemsList(userId: userId, completion: completionBlock)
    }
    
    func addItems(text:String, userId:String) {
        
        FirebaseManager.saveItem(text: text, userId: userId)
    }
    
    func deleteItem(item:Item) {
        
        FirebaseManager.deleteItem(item: item)
    }
}
