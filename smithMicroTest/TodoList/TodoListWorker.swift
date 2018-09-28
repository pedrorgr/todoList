//
//  TodoListWorker.swift
//  smithMicroTest
//
//  Created by catiavidinhas on 23/09/18.
//  Copyright © 2018 pedroribeiro. All rights reserved.
//

import UIKit


class TodoListWorker {

    let service: Service
    
    init(service: Service) {
        self.service = service
    }
    
    func fetchTodoList(userId:String, completionBlock:@escaping ([Item]) -> ()) {
        
        service.itemsList(userId: userId, completion: completionBlock)
    }
    
    func addItems(text:String, userId:String) {
        
        service.saveItem(text: text, userId: userId)
    }
    
    func deleteItem(item:Item) {
        
        service.deleteItem(item: item)
    }
}
